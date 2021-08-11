--DROP TABLE Sales.Tgt_Dim_customer;
--DROP TABLE Sales.Tgt_Fact_orders;
--DROP TABLE Sales.Tgt_Dim_category;
--DROP TABLE Sales.Tgt_Dim_products;
--DROP TABLE Sales.Tgt_Dim_address;

CREATE SCHEMA tgt authorization awsuser;

CREATE TABLE tgt.customer (
    CustomerID  int NOT NULL,
    CustomerSurrKey int IDENTITY(1,1),
    FirstName   nvarchar(50),
    MiddleName  nvarchar(50),
    LastName    nvarchar(50),
    Gender      nvarchar(50),
    PhoneNumber nvarchar(50),
    PhoneNumberType nvarchar(50),
    EmailAddress    nvarchar(100),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE tgt.order (
    Order_id    INT NOT NULL,
    OrderSurrKey int IDENTITY(1,1),
    Order_date  nvarchar(50),
    Order_status    nvarchar(50),
    Qty_ordered INT,
    Unit_price  FLOAT,
    Subtotal    FLOAT,
    Dim_Customer INT,
    Dim_Product INT,
    PRIMARY KEY (Order_id)
);

CREATE TABLE tgt.productcategory (
    Category_ID INT NOT NULL,
    CategorySurrKey int IDENTITY(1,1),
    Category    nvarchar(50),
    PRIMARY KEY (Category_ID)
);

CREATE TABLE tgt.product (
    Product_id  INT NOT NULL,
    ProductSurrKey int IDENTITY(1,1),
    Product     nvarchar(50),
    unit_price  FLOAT,
    Stock_code  nvarchar(50),
    Dim_Category INT,
    PRIMARY KEY (Product_id)
);

CREATE TABLE tgt.address (
    Dim_Customer INT NOT NULL,
    Country     nvarchar(50),
    AddressType  nvarchar(50),
    Street  nvarchar(50),
    PostalCode    nvarchar(50),
    City nvarchar(50),
    StateProviceName nvarchar(50)
);