truncate table staging.order; 
copy staging.order from 's3://usecase-data-lake/order000' iam_role 'arn:aws:iam::587889776762:role/redshift' DELIMITER '|' TIMEFORMAT 'auto';

TRUNCATE TABLE tgt.order;
INSERT INTO tgt.order (Order_id, Order_date, Order_status, Qty_ordered, Unit_price, Subtotal, Dim_Customer, Dim_Product)
SELECT o.Order_id, o.Order_date, o.Order_status, o.Qty_ordered, o.Unit_price, o.Subtotal, c.customersurrkey AS Dim_Customer, p.productsurrkey AS Dim_Product
FROM staging.order o
LEFT OUTER JOIN tgt.customer c ON o.Customer_id = c.CustomerID
LEFT OUTER JOIN tgt.product p ON o.Product_id = p.product_id;