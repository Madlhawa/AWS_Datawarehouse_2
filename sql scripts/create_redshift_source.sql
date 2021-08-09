CREATE SCHEMA source authorization awsuser;

CREATE TABLE source.customer (
    CustomerID  int NOT NULL,
    FirstName   nvarchar(MAX),
    MiddleName  nvarchar(MAX),
    LastName    nvarchar(MAX),
    Gender      nvarchar(MAX),
    PhoneNumber nvarchar(MAX),
    PhoneNumberType nvarchar(MAX),
    EmailAddress    nvarchar(MAX),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE source.order (
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

CREATE TABLE source.productCategory (
    Category_ID INT NOT NULL,
    Category    nvarchar(50),
    PRIMARY KEY (Category_ID)
);

CREATE TABLE source.product (
    Product_id  INT NOT NULL,
    Product     nvarchar(50),
    unit_price  FLOAT,
    Stock_code  nvarchar(50),
    Category    INT,
    PRIMARY KEY (Product_id)
);