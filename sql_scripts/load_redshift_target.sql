TRUNCATE TABLE tgt.customer;
INSERT INTO tgt.customer (CustomerID, FirstName, MiddleName, LastName, Gender, PhoneNumber, PhoneNumberType, EmailAddress)
SELECT CustomerID, FirstName, MiddleName, LastName, Gender, PhoneNumber, PhoneNumberType, EmailAddress
FROM staging.customer;

TRUNCATE TABLE tgt.order;
INSERT INTO tgt.order (Order_id, Order_date, Order_status, Qty_ordered, Unit_price, Subtotal, Dim_Customer, Dim_Product)
SELECT o.Order_id, o.Order_date, o.Order_status, o.Qty_ordered, o.Unit_price, o.Subtotal, c.customersurrkey AS Dim_Customer, p.productsurrkey AS Dim_Product
FROM staging.order o
LEFT OUTER JOIN tgt.customer c ON o.Customer_id = c.CustomerID
LEFT OUTER JOIN tgt.product p ON o.Product_id = p.product_id;

TRUNCATE TABLE tgt.address;
INSERT INTO tgt.address (dim_customer, country, addresstype, street, postalcode, city, stateprovicename)
SELECT c.customersurrkey AS dim_customer, a.country, a.addresstype, a.street, a.postalcode, a.city, a.stateprovicename
FROM staging.address a
LEFT OUTER JOIN tgt.customer c ON a.customerid = c.CustomerID;