/* HUB table */
CREATE TABLE IF NOT EXISTS Orders (
    order_id int PRIMARY KEY,
    order_date timestamp NOT NULL,
    order_source varchar(20) NOT NULL DEFAULT "ETL",
    zipcode	decimal(9,6) NOT NULL,
    user_id int NOT NULL,
    total int NOT NULL,
    item_count int NOT NULL
)

/* Suggested Satellite table, with added first and last name */
CREATE TABLE IF NOT EXISTS User (
    user_id int PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    user_date timestamp NOT NULL DEFAULT NOW(),
    user_source varchar(20) NOT NULL DEFAULT "ETL"
)

/* FK for User table */
ALTER TABLE Orders ADD CONSTRAINT Orders_User
    FOREIGN KEY (user_id)
    REFERENCES "User" (user_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

/* Tempo table for loading CSV without constraints */
CREATE TEMP TABLE tmp_orders (
    order_id int PRIMARY KEY,
    order_date timestamp NOT NULL,
    user_id int NOT NULL,
    zipcode	decimal(9,6) NOT NULL,
    total int NOT NULL,
    item_count int NOT NULL
)
ON COMMIT DROP;

/* Load CSV to temp table */
COPY tmp_orders FROM '../data/orders.csv';

/* First, insert into User table */
INSERT INTO User (user_id)
SELECT DISTINCT user_id
FROM tmp_orders

/* Then, insert into Orders table */
INSERT INTO Orders (order_id, order_date, zipcode, user_id, total, item_count)
SELECT DISTINCT ON (order_id) order_id,
    order_date,
    zipcode,
    user_id,
    total,
    item_count
FROM tmp_orders