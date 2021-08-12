CREATE TABLE public.trackingtable (
    data_group varchar(128) DEFAULT NULL,  
    data_pipeline_id varchar(128) DEFAULT NULL,  
    job_status varchar(2) DEFAULT NULL,  
    proc_start_dt date DEFAULT NULL,  
    proc_start_tm time DEFAULT NULL,  
    proc_end_dt date DEFAULT NULL,  
    proc_end_tm time DEFAULT NULL
)

DELETE FROM public.trackingtable WHERE data_group = 'usecase';

INSERT INTO public.trackingtable(
    data_group, 
    data_pipeline_id,  
    job_status,  
    proc_start_dt,  
    proc_start_tm
)
VALUES(
    'usecase',
    '123',
    'r',
    CONVERT(VARCHAR(10), getdate(), 111),
    convert(varchar(10), GETDATE(), 108)
)

UPDATE public.trackingtable
SET job_status = 'c', proc_end_dt = CONVERT(VARCHAR(10), getdate(), 111), proc_end_tm = convert(varchar(10), GETDATE(), 108)
WHERE data_group = 'usecase';