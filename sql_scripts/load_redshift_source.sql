truncate table source.customer;
truncate table source.order;
truncate table source.productCategory;
truncate table source.product;

copy source.customer
from 's3://usecase-source-data/customers.csv'
iam_role 'arn:aws:iam::587889776762:role/redshift'
DELIMITER ',' 
IGNOREHEADER 1 
TIMEFORMAT 'auto';

copy source.order
from 's3://usecase-source-data/orders.csv'
iam_role 'arn:aws:iam::587889776762:role/redshift'
DELIMITER ',' 
IGNOREHEADER 1 
TIMEFORMAT 'auto';

copy source.productcategory
from 's3://usecase-source-data/productCategories.csv'
iam_role 'arn:aws:iam::587889776762:role/redshift'
DELIMITER ',' 
IGNOREHEADER 1 
TIMEFORMAT 'auto';

copy source.product
from 's3://usecase-source-data/products.csv'
iam_role 'arn:aws:iam::587889776762:role/redshift'
DELIMITER ',' 
IGNOREHEADER 1 
TIMEFORMAT 'auto';