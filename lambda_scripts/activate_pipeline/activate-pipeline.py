import json
import boto3
import psycopg2

def lambda_handler(event, context):
    
    client = boto3.client('datapipeline')
    pipelines = client.list_pipelines()['pipelineIdList']
    
    for pipeline in pipelines:
        if pipeline['name'] == 'pipeline3':
            id = pipeline['id']
            # response = client.activate_pipeline(pipelineId=id)

    # engine = create_engine(f'postgresql://{config["redshift"]["username"]}:{config["redshift"]["password"]}@redshift-cluster.cy8zz3a1tpnj.us-east-1.redshift.amazonaws.com:5439/dev')
    con=psycopg2.connect(dbname= 'dev', host='redshift-cluster.cy8zz3a1tpnj.us-east-1.redshift.amazonaws.com', port= '5439', user= 'awsuser', password= 'Sysco123')        
    cur = con.cursor()
    cur.execute("""
        DELETE FROM public.trackingtable WHERE data_group = 'usecase';

        INSERT INTO public.trackingtable(data_group, data_pipeline_id,  job_status,  proc_start_dt, proc_start_tm)
        VALUES('usecase','123','r',CAST(getdate() AS date),CAST(getdate() AS time));
    """)

    return id