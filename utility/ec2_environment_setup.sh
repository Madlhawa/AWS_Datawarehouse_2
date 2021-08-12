sudo apt update
sudo apt install libpq-dev python3-dev
sudo apt install git
sudo apt install python3-pip
pip3 install boto3
pip3 install pandas
pip3 install sqlalchemy
pip3 install psycopg2


sudo apt-add-repository universe
sudo apt update
sudo apt-get install nodejs
sudo apt install python2-minimal
sudo apt install default-jre
sudo apt install default-jdk

java -jar TaskRunner-1.0.jar --config ~/credentials.json --workerGroup=madhawa --region=us-east-1 --logUri=s3://usecase-data-pipeline/output/