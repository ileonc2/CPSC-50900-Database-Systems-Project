--Database created using 'create database' command
-- Command used because I had to manually enter the scripts into mariadb through virtual machine

-- tables: 'create table' command lets you create an entity in the database. By defining the attributes below along with 'create table'
-- you are also creating attributes for the table

--You can define the attribute after naming it by adding the datatype or any constraints such as NOT NULL which doesn't allow 
-- a cell to be empty

--You can assign the Primary key using  CONSTRAINT 'table_name'_pk PRIMARY KEY

--The 'alter table' command lets you adjust mostly anything involving that specific table. In here we are using it to define foreign keys
--by adding a constarint to the relationship between tables and identifying which attribute relates them.

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
    PAYMENT_ROUTNG int,
    PAYMENT_ACCOUNT int,
    PAY_CHECK_NUM int,
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

