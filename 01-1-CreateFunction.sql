
-- --------------------------
-- IndexTestDB
-- --------------------------

USE IndexTestDB
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'dbo.ufn_FillZeros', N'FN') IS NOT NULL  
    DROP FUNCTION ufn_FillZeros;  
GO  

-- -------------------------------------
-- ヘ: 盢肚 int, ﹚计, 干ì玡竚 0 肚
-- : 程 30  bytes
-- ㊣絛ㄒ: 
--		declare @result varchar(30)
--		select @result = dbo.ufn_FillZeros(123, 6);
--		print @result
-- -------------------------------------
CREATE FUNCTION ufn_FillZeros 
(
	@pi_number		int,	-- 饼干玡竚 0 计
	@pi_digits		int		-- 璶舱Θ碭计﹃
)
RETURNS varchar(30)
AS
BEGIN
	DECLARE @result varchar(30)
	
	SELECT @result =
		RIGHT(
			REPLICATE('0', @pi_digits) + CAST(@pi_number as VARCHAR)
			, @pi_digits);
	
	RETURN @result;

END
GO

-- --------------------------
-- IndexTestDB_Backup
-- --------------------------

USE IndexTestDB_Backup
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID (N'dbo.ufn_FillZeros', N'FN') IS NOT NULL  
    DROP FUNCTION ufn_FillZeros;  
GO  

-- -------------------------------------
-- ヘ: 盢肚 int, ﹚计, 干ì玡竚 0 肚
-- : 程 30  bytes
-- ㊣絛ㄒ: 
--		declare @result varchar(30)
--		select @result = dbo.ufn_FillZeros(123, 6);
--		print @result
-- -------------------------------------
CREATE FUNCTION ufn_FillZeros 
(
	@pi_number		int,	-- 饼干玡竚 0 计
	@pi_digits		int		-- 璶舱Θ碭计﹃
)
RETURNS varchar(30)
AS
BEGIN
	DECLARE @result varchar(30)
	
	SELECT @result =
		RIGHT(
			REPLICATE('0', @pi_digits) + CAST(@pi_number as VARCHAR)
			, @pi_digits);
	
	RETURN @result;

END
GO
