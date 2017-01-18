-- -------------------------------
-- 更新 IndexTestDB_Backup.dbo.MyTable 的 20160302 資料 (MarkXX 的資料, 都改為 'Y')
-- -------------------------------
DECLARE @stime		datetime 
,		@etime		datetime


-- =========================================================================

SELECT @stime = SYSDATETIME();
PRINT 'START TIME: ' + FORMAT(@stime, 'yyyy-MM-dd HH:mm:ss.fffffff');
--PRINT CONVERT(VARCHAR(27), SYSDATETIME(), 121);

-- -------------------------------------------
-- 注意: 這裡會回傳 20,000 筆的資料; 
--      10,000筆是 IndexTestDB_Backup 刪掉的; 
--      10,000筆是 IndexTestDB_Backup 有異動的; 
-- -------------------------------------------

SELECT *
FROM IndexTestDB.dbo.MyTable
EXCEPT
SELECT *
FROM IndexTestDB_Backup.dbo.MyTable
;

SELECT @etime = SYSDATETIME();
PRINT 'END TIME: ' + FORMAT(@etime, 'yyyy-MM-dd HH:mm:ss.fffffff');

-- http://matijabozicevic.com/blog/sql-server-development/sql-calculating-time-difference-in-minutes-hours-days-weeks-months-years
PRINT 'DIFF: ' 
		+ CAST(DATEDIFF(millisecond, @stime, @etime) / 1000 / 60 % 60 AS VARCHAR) + ' minutes ' 
		+ CAST(DATEDIFF(millisecond, @stime, @etime) / 1000 % 60 AS VARCHAR) + ' seconds ' 
		+ CAST(DATEDIFF(millisecond, @stime, @etime) % 1000 AS VARCHAR) + ' milliseconds '
		;

-- =========================================================================

SELECT @stime = SYSDATETIME();
PRINT 'START TIME: ' + FORMAT(@stime, 'yyyy-MM-dd HH:mm:ss.fffffff');
--PRINT CONVERT(VARCHAR(27), SYSDATETIME(), 121);

-- -------------------------------------------
-- 注意: 這裡會回傳 10,000 筆的資料; 
--      刪掉的, 不會被抓出來; 
--      10,000筆是 IndexTestDB_Backup 有異動的; 
-- -------------------------------------------
SELECT *
FROM IndexTestDB_Backup.dbo.MyTable
EXCEPT
SELECT *
FROM IndexTestDB.dbo.MyTable
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


