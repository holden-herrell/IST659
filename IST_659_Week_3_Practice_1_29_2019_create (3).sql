-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-01-30 01:07:49.831

-- tables
-- Table: Customer
CREATE TABLE Customer (
    CustomerID int  NOT NULL IDENTITY,
    CustomerName varchar(50)  NOT NULL,
    CustomerPhone varchar(50)  NOT NULL,
    CONSTRAINT Customer_ak_1 UNIQUE (CustomerName),
    CONSTRAINT Customer_pk PRIMARY KEY  (CustomerID)
);

-- Table: CustomerAddress
CREATE TABLE CustomerAddress (
    CustomerAddressID int  NOT NULL IDENTITY,
    Customer_CustomerID int  NOT NULL,
    StreetAddress varchar(50)  NOT NULL,
    City varchar(50)  NOT NULL,
    StateOrProvince varchar(50)  NOT NULL,
    PostalCode varchar(50)  NOT NULL,
    CONSTRAINT CustomerAddress_pk PRIMARY KEY  (CustomerAddressID)
);

-- Table: Item
CREATE TABLE Item (
    ItemID int  NOT NULL IDENTITY,
    ItemName varchar(50)  NOT NULL,
    ItemDescription varchar(256)  NOT NULL,
    ItemListPrice decimal(19,4)  NOT NULL,
    CONSTRAINT Item_ak_1 UNIQUE (ItemName),
    CONSTRAINT Item_pk PRIMARY KEY  (ItemID)
);

-- Table: SalesOrder
CREATE TABLE SalesOrder (
    SalesOrderID int  NOT NULL IDENTITY,
    Customer_CustomerID int  NOT NULL,
    SalesOrderDate datetime  NOT NULL,
    SalesOrderNotes varchar(256)  NULL,
    CONSTRAINT SalesOrder_pk PRIMARY KEY  (SalesOrderID)
);

-- Table: SalesOrderItemList
CREATE TABLE SalesOrderItemList (
    SalesOrderItemListID int  NOT NULL IDENTITY,
    SalesOrder_SalesOrderID int  NOT NULL,
    Item_ItemID int  NOT NULL,
    OrderQty int  NOT NULL,
    OrderPrice money  NOT NULL,
    CONSTRAINT SalesOrderItemList_pk PRIMARY KEY  (SalesOrderItemListID)
);

-- foreign keys
-- Reference: CustomerAddress_Customer (table: CustomerAddress)
ALTER TABLE CustomerAddress ADD CONSTRAINT CustomerAddress_Customer
    FOREIGN KEY (Customer_CustomerID)
    REFERENCES Customer (CustomerID);

-- Reference: SalesOrderItemList_Item (table: SalesOrderItemList)
ALTER TABLE SalesOrderItemList ADD CONSTRAINT SalesOrderItemList_Item
    FOREIGN KEY (Item_ItemID)
    REFERENCES Item (ItemID);

-- Reference: SalesOrderItemList_SalesOrder (table: SalesOrderItemList)
ALTER TABLE SalesOrderItemList ADD CONSTRAINT SalesOrderItemList_SalesOrder
    FOREIGN KEY (SalesOrder_SalesOrderID)
    REFERENCES SalesOrder (SalesOrderID);

-- Reference: SalesOrder_Customer (table: SalesOrder)
ALTER TABLE SalesOrder ADD CONSTRAINT SalesOrder_Customer
    FOREIGN KEY (Customer_CustomerID)
    REFERENCES Customer (CustomerID);

-- End of file.

