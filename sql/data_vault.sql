-- Created by Leonel Atencio
-- Last modification date: 2018-11-12

-- tables
-- Table: Orders
CREATE TABLE Orders (
    order_id int  NOT NULL,
    order_date timestamp  NOT NULL,
    order_source varchar(20)  NOT NULL,
    zipcode int  NOT NULL,
    user_id int  NOT NULL,
    total int  NOT NULL,
    item_count int  NOT NULL,
    CONSTRAINT Orders_pk PRIMARY KEY (order_id)
);

-- Table: User
CREATE TABLE "User" (
    user_id int  NOT NULL,
    first_name varchar(100)  NOT NULL,
    last_name varchar(100)  NOT NULL,
    user_date timestamp  NOT NULL,
    user_source varchar(20)  NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (user_id)
);

-- Table: ZipCode
CREATE TABLE ZipCode (
    zipcode int  NOT NULL,
    latitude decimal(9,6)  NOT NULL,
    longitude decimal(9,6)  NOT NULL,
    state varchar(100)  NOT NULL,
    city varchar(100)  NOT NULL,
    CONSTRAINT ZipCode_pk PRIMARY KEY (zipcode)
);

-- foreign keys
-- Reference: Orders_User (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Orders_User
    FOREIGN KEY (user_id)
    REFERENCES "User" (user_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Orders_ZipCode (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Orders_ZipCode
    FOREIGN KEY (zipcode)
    REFERENCES ZipCode (zipcode)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.
