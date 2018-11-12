-- Created by Leonel Atencio
-- Last modification date: 2018-11-12

-- tables
-- Table: Order
CREATE TABLE "Order" (
    order_id int  NOT NULL,
    order_date timestamp  NOT NULL,
    order_source varchar(20)  NOT NULL,
    CONSTRAINT Order_pk PRIMARY KEY (order_id)
);

-- Table: ShopFact
CREATE TABLE ShopFact (
    shopfact_id int  NOT NULL,
    order_id int  NOT NULL,
    user_id int  NOT NULL,
    zipcode int  NOT NULL,
    transaction_id int  NOT NULL,
    CONSTRAINT ShopFact_pk PRIMARY KEY (shopfact_id)
);

-- Table: Transaction
CREATE TABLE Transaction (
    transaction_id int  NOT NULL,
    total int  NOT NULL,
    item_count int  NOT NULL,
    transaction_date timestamp  NOT NULL,
    transaction_source varchar(20)  NOT NULL,
    CONSTRAINT Transaction_pk PRIMARY KEY (transaction_id)
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
-- Reference: ShopFact_Order (table: ShopFact)
ALTER TABLE ShopFact ADD CONSTRAINT ShopFact_Order
    FOREIGN KEY (order_id)
    REFERENCES "Order" (order_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ShopFact_Transaction (table: ShopFact)
ALTER TABLE ShopFact ADD CONSTRAINT ShopFact_Transaction
    FOREIGN KEY (transaction_id)
    REFERENCES Transaction (transaction_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ShopFact_User (table: ShopFact)
ALTER TABLE ShopFact ADD CONSTRAINT ShopFact_User
    FOREIGN KEY (user_id)
    REFERENCES "User" (user_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ShopFact_ZipCode (table: ShopFact)
ALTER TABLE ShopFact ADD CONSTRAINT ShopFact_ZipCode
    FOREIGN KEY (zipcode)
    REFERENCES ZipCode (zipcode)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

