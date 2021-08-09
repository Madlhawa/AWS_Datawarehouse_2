from sqlalchemy import create_engine
from configparser import ConfigParser

config = ConfigParser()
config.read('./utility/config.ini')

table = 'order'

engine = create_engine('postgresql://'+config['redshift']['username']+':'+config['redshift']['password']+'@redshift-cluster.cy8zz3a1tpnj.us-east-1.redshift.amazonaws.com:5439/dev')


with engine.connect() as connection:
        query = f"unload('select * from rs_source.{table}') to 's3://seed-data-lake/{table}' iam_role 'arn:aws:iam::587889776762:role/redshift' parallel off allowoverwrite csv;"
        result = connection.execute(query)
        print(f'loding table {table}')

print(result)