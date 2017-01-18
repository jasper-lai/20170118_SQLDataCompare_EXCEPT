-- -------------------------------
-- ��s IndexTestDB_Backup.dbo.MyTable �� 20160302 ��� (MarkXX �����, ���אּ 'Y')
-- -------------------------------
DECLARE @stime		datetime 
,		@etime		datetime


-- =========================================================================

SELECT @stime = SYSDATETIME();
PRINT 'START TIME: ' + FORMAT(@stime, 'yyyy-MM-dd HH:mm:ss.fffffff');
--PRINT CONVERT(VARCHAR(27), SYSDATETIME(), 121);

-- -------------------------------------------
-- �`�N: �o�̷|�^�� 20,000 �������; 
--      10,000���O IndexTestDB_Backup �R����; 
--      10,000���O IndexTestDB_Backup �����ʪ�; 
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
-- �`�N: �o�̷|�^�� 10,000 �������; 
--      �R����, ���|�Q��X��; 
--      10,000���O IndexTestDB_Backup �����ʪ�; 
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


