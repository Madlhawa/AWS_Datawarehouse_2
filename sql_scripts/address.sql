truncate table staging.address; 
copy staging.address from 's3://usecase-data-lake/address' iam_role 'arn:aws:iam::587889776762:role/redshift' DELIMITER '|' TIMEFORMAT 'auto';

TRUNCATE TABLE tgt.address;
INSERT INTO tgt.address (dim_customer, country, addresstype, street, postalcode, city, stateprovicename)
SELECT c.customersurrkey AS dim_customer, a.country, a.addresstype, a.street, a.postalcode, a.city, a.stateprovicename
FROM staging.address a
LEFT OUTER JOIN tgt.customer c ON a.customerid = c.CustomerID;