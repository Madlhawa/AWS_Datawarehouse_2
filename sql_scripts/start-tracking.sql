DELETE FROM public.trackingtable WHERE data_group = 'usecase';

INSERT INTO public.trackingtable(data_group, data_pipeline_id,  job_status,  proc_start_dt, proc_start_tm)
VALUES('usecase','123','r',CAST(getdate() AS date),CAST(getdate() AS time));