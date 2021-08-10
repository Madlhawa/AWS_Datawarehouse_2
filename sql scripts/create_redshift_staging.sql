CREATE SCHEMA staging authorization awsuser;

CREATE TABLE staging.customer (
    CustomerID  int NOT NULL,
    FirstName   nvarchar(50),
    MiddleName  nvarchar(50),
    LastName    nvarchar(50),
    Gender      nvarchar(50),
    PhoneNumber nvarchar(50),
    PhoneNumberType nvarchar(50),
    EmailAddress    nvarchar(100),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE staging.order (
    Order_id    INT NOT NULL,
    Order_date  nvarchar(50),
    Order_status    nvarchar(50),
    Product_id  INT,
    Qty_ordered INT,
    Unit_price  FLOAT,
    Subtotal    FLOAT,
    Customer_id INT,
    PRIMARY KEY (Order_id)
);

CREATE TABLE staging.productCategory (
    Category_ID INT NOT NULL,
    Category    nvarchar(50),
    PRIMARY KEY (Category_ID)
);

CREATE TABLE staging.product (
    Product_id  INT NOT NULL,
    Product     nvarchar(50),
    unit_price  FLOAT,
    Stock_code  nvarchar(50),
    Category    INT,
    PRIMARY KEY (Product_id)
);

CREATE TABLE staging.address (
  	Country     nvarchar(50),
    CustomerID  INT,
    AddressType  nvarchar(50),
    Street  nvarchar(50),
    PostalCode    nvarchar(50),
    City nvarchar(50),
    StateProviceName nvarchar(50)
);