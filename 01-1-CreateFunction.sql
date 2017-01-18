
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
-- �ت�: �N�ǤJ�� int, �H���w�����, �ɨ��e�m 0 ��^��
-- ����: �̦h 30 �� bytes
-- �I�s�d��: 
--		declare @result varchar(30)
--		select @result = dbo.ufn_FillZeros(123, 6);
--		print @result
-- -------------------------------------
CREATE FUNCTION ufn_FillZeros 
(
	@pi_number		int,	-- ���ɫe�m 0 ���Ʀr
	@pi_digits		int		-- �n�զ��X��ƪ��r��
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
-- �ت�: �N�ǤJ�� int, �H���w�����, �ɨ��e�m 0 ��^��
-- ����: �̦h 30 �� bytes
-- �I�s�d��: 
--		declare @result varchar(30)
--		select @result = dbo.ufn_FillZeros(123, 6);
--		print @result
-- -------------------------------------
CREATE FUNCTION ufn_FillZeros 
(
	@pi_number		int,	-- ���ɫe�m 0 ���Ʀr
	@pi_digits		int		-- �n�զ��X��ƪ��r��
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
