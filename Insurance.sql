-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-18 05:19:49.327

-- tables
-- Table: CLAIMS
CREATE TABLE CLAIMS (
    POLICY_ID int NOT NULL,
    CLAIMS_ID int NOT NULL,
    CLAIMS_DATE date NOT NULL,
    CLAIMS_DOC_ID int NOT NULL,
    CONSTRAINT CLAIMS_pk PRIMARY KEY (CLAIMS_ID)
);

-- Table: CUSTOMER
CREATE TABLE CUSTOMER (
    POLICY_ID int NOT NULL,
    CUSTOMER_NAME varchar(25) NOT NULL,
    CUSTOMER_DOB date NOT NULL,
    CUSTOMER_ADDRESS varchar(50) NOT NULL,
    CUST_PAYMENT_TYPE varchar(16) NOT NULL,
    CONSTRAINT CUSTOMER_pk PRIMARY KEY (POLICY_ID)
);

-- Table: DRIVER
CREATE TABLE DRIVER (
    POLICY_ID int NOT NULL,
    POLICY_PLAN int NOT NULL,
    DRIVER_LICENSE varchar(12) NOT NULL,
    DRIVER_HISTORY char(1) NOT NULL,
    CONSTRAINT DRIVER_pk PRIMARY KEY (DRIVER_LICENSE)
);

-- Table: PAYMENT
CREATE TABLE PAYMENT (
    POLICY_ID int NOT NULL,
    PAYMENT_TYPE varchar(16) NOT NULL,
    PAYMENT_ROUTNG int NOT NULL,
    PAYMENT_ACCOUNT int NOT NULL,
    PAY_CHECK_NUM int NOT NULL,
    CONSTRAINT PAYMENT_pk PRIMARY KEY (PAYMENT_TYPE)
);

-- Table: POLICY
CREATE TABLE POLICY (
    POLICY_ID int NOT NULL,
    POLICY_PLAN int NOT NULL,
    POLICY_PRICE int NOT NULL,
    CONSTRAINT POLICY_pk PRIMARY KEY (POLICY_PLAN)
);

-- foreign keys
-- Reference: CLAIMS_CUSTOMER (table: CLAIMS)
ALTER TABLE CLAIMS ADD CONSTRAINT CLAIMS_CUSTOMER FOREIGN KEY CLAIMS_CUSTOMER (POLICY_ID)
    REFERENCES CUSTOMER (POLICY_ID);

-- Reference: DRIVER_CUSTOMER (table: DRIVER)
ALTER TABLE DRIVER ADD CONSTRAINT DRIVER_CUSTOMER FOREIGN KEY DRIVER_CUSTOMER (POLICY_ID)
    REFERENCES CUSTOMER (POLICY_ID);

-- Reference: PAYMENT_CUSTOMER (table: PAYMENT)
ALTER TABLE PAYMENT ADD CONSTRAINT PAYMENT_CUSTOMER FOREIGN KEY PAYMENT_CUSTOMER (POLICY_ID)
    REFERENCES CUSTOMER (POLICY_ID);

-- Reference: POLICY_CUSTOMER (table: POLICY)
ALTER TABLE POLICY ADD CONSTRAINT POLICY_CUSTOMER FOREIGN KEY POLICY_CUSTOMER (POLICY_ID)
    REFERENCES CUSTOMER (POLICY_ID);

-- End of file.

