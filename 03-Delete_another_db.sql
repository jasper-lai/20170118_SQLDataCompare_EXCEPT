-- -------------------------------
-- 刪除 IndexTestDB_Backup.dbo.MyTable 的 20160301 資料
-- -------------------------------
USE IndexTestDB_Backup
GO

DECLARE @stime		datetime 
,		@etime		datetime

SELECT @stime = SYSDATETIME();
PRINT 'START TIME: ' + FORMAT(@stime, 'yyyy-MM-dd HH:mm:ss.fffffff');
--PRINT CONVERT(VARCHAR(27), SYSDATETIME(), 121);

DELETE A
FROM MyTable A
WHERE A.TxDate = 20160301
;

SELECT @etime = SYSDATETIME();
PRINT 'END TIME: ' + FORMAT(@etime, 'yyyy-MM-dd HH:mm:ss.fffffff');

-- http://matijabozicevic.com/blog/sql-server-development/sql-calculating-time-difference-in-minutes-hours-days-weeks-months-years
PRINT 'DIFF: ' 
		+ CAST(DATEDIFF(millisecond, @stime, @etime) / 1000 / 60 % 60 AS VARCHAR) + ' minutes ' 
		+ CAST(DATEDIFF(millisecond, @stime, @etime) / 1000 % 60 AS VARCHAR) + ' seconds ' 
		+ CAST(DATEDIFF(millisecond, @stime, @etime) % 1000 AS VARCHAR) + ' milliseconds '
		;
GO


