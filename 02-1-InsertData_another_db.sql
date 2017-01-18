USE IndexTestDB_Backup
GO

DECLARE @year		int  = 2016
,		@month		int  = 1
,		@day		int  = 1
,		@txdate		int	 = 20160101
,		@id			int  = 1
,		@qty		decimal(13,0)	= 0
,		@amt		decimal(16,0)	= 0
,		@mark01		varchar(1)		= 'Y'
,		@mark02		varchar(1)		= 'N'
,		@mark03		varchar(1)		= 'Y'
,		@mark04		varchar(1)		= 'N'
,		@mark05		varchar(1)		= 'Y'
,		@price01	decimal(10,4)	= 10
,		@price02	decimal(10,4)	= 20
,		@price03	decimal(10,4)	= 30
,		@price04	decimal(10,4)	= 40
,		@price05	decimal(10,4)	= 50
,		@discount01	decimal(3,2)	= 1.00
,		@discount02	decimal(3,2)	= 0.90
,		@discount03	decimal(3,2)	= 1.00
,		@discount04	decimal(3,2)	= 0.90
,		@discount05	decimal(3,2)	= 1.00
,		@remark		nvarchar(64) = ''
,		@stime		datetime 
,		@etime		datetime
,		@id_vc		varchar(6)		= ''

SET NOCOUNT ON

TRUNCATE TABLE MyTable;

SELECT @stime = SYSDATETIME();
PRINT 'START TIME: ' + FORMAT(@stime, 'yyyy-MM-dd HH:mm:ss.fffffff');
--PRINT CONVERT(VARCHAR(27), SYSDATETIME(), 121);

WHILE @id <= 10000
BEGIN
	SELECT @id_vc = dbo.ufn_FillZeros(@id, 6);	-- ±N id Âà¬° varchar(6)

	BEGIN TRANSACTION
	WHILE @month <= 12
	BEGIN
		WHILE @day <= 30
		BEGIN
			SELECT @txdate = @year * 10000 + @month * 100 + @day;
			SELECT @qty = @id * 10;
			SELECT @amt = @id * 20;
			INSERT INTO MyTable VALUES	( @id_vc, @txdate, @qty, @amt
										, @mark01, @mark02, @mark03, @mark04, @mark05
										, @price01, @price02, @price03, @price04, @price05
										, @discount01, @discount02, @discount03, @discount04, @discount05
										, @remark);
			SELECT @day = @day + 1
		END
		SELECT @month = @month + 1
		SELECT @day = 1
	END
	COMMIT TRANSACTION
	SELECT @id = @id + 1
	SELECT @month = 1
	SELECT @day = 1
END

SELECT @etime = SYSDATETIME();
PRINT 'END TIME: ' + FORMAT(@etime, 'yyyy-MM-dd HH:mm:ss.fffffff');

-- http://matijabozicevic.com/blog/sql-server-development/sql-calculating-time-difference-in-minutes-hours-days-weeks-months-years
PRINT 'DIFF: ' 
		+ CAST(DATEDIFF(millisecond, @stime, @etime) / 1000 / 60 % 60 AS VARCHAR) + ' minutes ' 
		+ CAST(DATEDIFF(millisecond, @stime, @etime) / 1000 % 60 AS VARCHAR) + ' seconds ' 
		+ CAST(DATEDIFF(millisecond, @stime, @etime) % 1000 AS VARCHAR) + ' milliseconds '
		;
GO


