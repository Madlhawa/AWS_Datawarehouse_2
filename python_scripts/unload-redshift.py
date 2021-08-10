import sys
from sqlalchemy import create_engine
from configparser import ConfigParser

try:
        table = sys.argv[1]
except:
        print("ERROR: Table name argument not passed.")
        quit()

config = ConfigParser()
config.read('./utility/config.ini')

engine = create_engine(f'postgresql://{config["redshift"]["username"]}:{config["redshift"]["password"]}@redshift-cluster.cy8zz3a1tpnj.us-east-1.redshift.amazonaws.com:5439/dev')


with engine.connect() as connection:
        query = f"unload('select * from source.{table}') to 's3://usecase-data-lake/{table}' iam_role 'arn:aws:iam::587889776762:role/redshift' parallel off allowoverwrite csv;"
        result = connection.execute(query)
        print(f'{table} table unloaded.')