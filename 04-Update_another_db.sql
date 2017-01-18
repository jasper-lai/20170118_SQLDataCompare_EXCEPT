-- -------------------------------
-- 更新 IndexTestDB_Backup.dbo.MyTable 的 20160302 資料 (MarkXX 的資料, 都改為 'Y')
-- -------------------------------
USE IndexTestDB_Backup
GO

DECLARE @stime		datetime 
,		@etime		datetime

SELECT @stime = SYSDATETIME();
PRINT 'START TIME: ' + FORMAT(@stime, 'yyyy-MM-dd HH:mm:ss.fffffff');
--PRINT CONVERT(VARCHAR(27), SYSDATETIME(), 121);

UPDATE A
SET A.Mark01 = 'Y'
,   A.Mark02 = 'Y'
,   A.Mark03 = 'Y'
,   A.Mark04 = 'Y'
,   A.Mark05 = 'Y'
FROM MyTable A
WHERE A.TxDate = 20160302
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


