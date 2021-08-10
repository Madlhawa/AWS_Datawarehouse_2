import sys
from sqlalchemy import create_engine
from configparser import ConfigParser

try:
    sourceFile = sys.argv[1]
    table = sys.argv[2]
except:
    print("ERROR: Table name argument not passed.")
    quit()

config = ConfigParser()
config.read('./utility/config.ini')

engine = create_engine(f'postgresql://{config["redshift"]["username"]}:{config["redshift"]["password"]}@redshift-cluster.cy8zz3a1tpnj.us-east-1.redshift.amazonaws.com:5439/dev')

with engine.connect() as connection:
    query = f"truncate table staging.{table}; copy staging.{table} from 's3://userdata-data-lake/{sourceFile}' iam_role 'arn:aws:iam::587889776762:role/redshift' DELIMITER ',' TIMEFORMAT 'auto';"
    result = connection.execute(query)
    
print(f'{table} loaded successfully')