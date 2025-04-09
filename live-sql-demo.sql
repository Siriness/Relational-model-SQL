-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    Address VARCHAR2(100),
    Email VARCHAR2(50),
    Phone VARCHAR2(20)
);

-- Create ORDERS table
CREATE TABLE ORDERS (
    OrderID NUMBER PRIMARY KEY,
    OrderDate DATE DEFAULT SYSDATE,
    CustomerID NUMBER NOT NULL,
    Status VARCHAR2(20),
    CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);

-- Create PRODUCT table
CREATE TABLE PRODUCT (
    ProductID NUMBER PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    Description VARCHAR2(200),
    Price NUMBER(10,2) CHECK (Price > 0),
    StockQuantity NUMBER CHECK (StockQuantity >= 0),
    Category VARCHAR2(20)
);

-- Create ORDERDETAIL table
CREATE TABLE ORDERDETAIL (
    OrderDetailID NUMBER PRIMARY KEY,
    OrderID NUMBER NOT NULL,
    ProductID NUMBER NOT NULL,
    Quantity NUMBER NOT NULL CHECK (Quantity > 0),
    UnitPrice NUMBER(10,2) NOT NULL CHECK (UnitPrice > 0),
    CONSTRAINT fk_order FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
    CONSTRAINT fk_product FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);