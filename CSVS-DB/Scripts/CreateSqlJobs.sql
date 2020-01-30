-- =======================================================
-- ADD SCHEDULED JOBS TO IBUYSPY Commerce DB
-- =======================================================

Declare @JobCount int

--USE msdb

SELECT @JobCount=Count(name) FROM sysjobs where name='RemoveAbandonedCarts'

If @JobCount<>0	exec sp_delete_job @job_name='RemoveAbandonedCarts' 

exec sp_add_job
	@job_name = 'RemoveAbandonedCarts',
	@enabled = 1,
	@notify_level_eventlog = 3

exec sp_add_jobserver
	@job_name = 'RemoveAbandonedCarts',
	@server_name = "(local)"

exec sp_add_jobstep
	@job_name = 'RemoveAbandonedCarts',
	@step_name = 'Step 1',
	@command = "exec ShoppingCartRemoveAbandoned",
	@database_name = 'Commerce',
	@retry_attempts = 2,
	@retry_interval = 5

exec sp_add_jobschedule
	@job_name = 'RemoveAbandonedCarts',
	@name = 'Every day at 12AM',
	@freq_type = 4,
	@freq_interval = 1,
	@freq_subday_type = 1

GO
--
-- end scheduled jobs
-- 
