import sys
from sqlalchemy import create_engine
from configparser import ConfigParser

try:
    sqlFile = sys.argv[1]
except:
    print("ERROR: filename not passed correclty.")
    quit()

config = ConfigParser()
config.read('./utility/config.ini')

fileObject = open(f"./sql_scripts/{sqlFile}.sql", "r")

engine = create_engine(f'postgresql://{config["redshift"]["username"]}:{config["redshift"]["password"]}@redshift-cluster.cy8zz3a1tpnj.us-east-1.redshift.amazonaws.com:5439/dev')

with engine.connect() as connection:
    query = fileObject.read()
    result = connection.execute(query)
    
print(f'{sqlFile} executed successfully')