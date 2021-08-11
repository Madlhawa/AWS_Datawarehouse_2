truncate table staging.customer; 
copy staging.customer from 's3://usecase-data-lake/customer000' iam_role 'arn:aws:iam::587889776762:role/redshift' DELIMITER '|' TIMEFORMAT 'auto';

TRUNCATE TABLE tgt.customer;
INSERT INTO tgt.customer (CustomerID, FirstName, MiddleName, LastName, Gender, PhoneNumber, PhoneNumberType, EmailAddress)
SELECT CustomerID, FirstName, MiddleName, LastName, Gender, PhoneNumber, PhoneNumberType, EmailAddress
FROM staging.customer;