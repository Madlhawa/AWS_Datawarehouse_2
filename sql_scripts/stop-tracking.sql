UPDATE public.trackingtable
SET job_status = 'c', proc_end_dt = CAST(getdate() AS date), proc_end_tm = CAST(getdate() AS time)
WHERE data_group = 'usecase';