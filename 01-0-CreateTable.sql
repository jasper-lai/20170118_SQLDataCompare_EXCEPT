
-- ------------------------------
-- IndexTestDB_Backup
-- ------------------------------
USE IndexTestDB
GO

DROP TABLE MyTable
GO

CREATE TABLE MyTable
(
	[ProductId]		varchar(06)			NOT NULL,
	[TxDate]		[decimal](8, 0)		NOT NULL,
	[Qty]			[decimal](13, 0)	NULL,
	[Amt]			[decimal](16, 0)	NULL,
	[Mark01]		[varchar](1)		NULL,	-- Y/N
	[Mark02]		[varchar](1)		NULL,	-- Y/N
	[Mark03]		[varchar](1)		NULL,	-- Y/N
	[Mark04]		[varchar](1)		NULL,	-- Y/N
	[Mark05]		[varchar](1)		NULL,	-- Y/N
	[Price01]		[decimal](10, 4)	NULL,
	[Price02]		[decimal](10, 4)	NULL,
	[Price03]		[decimal](10, 4)	NULL,
	[Price04]		[decimal](10, 4)	NULL,
	[Price05]		[decimal](10, 4)	NULL,
	[Discount01]	[decimal](3, 2)		NULL,	-- 0.00 ~ 1.00
	[Discount02]	[decimal](3, 2)		NULL,	-- 0.00 ~ 1.00
	[Discount03]	[decimal](3, 2)		NULL,	-- 0.00 ~ 1.00
	[Discount04]	[decimal](3, 2)		NULL,	-- 0.00 ~ 1.00
	[Discount05]	[decimal](3, 2)		NULL,	-- 0.00 ~ 1.00
	[Remark]		[nvarchar](64)		NULL,
	CONSTRAINT PK_MyTable PRIMARY KEY (ProductId, TxDate)
)
GO

-- ------------------------------
-- IndexTestDB_Backup
-- ------------------------------
USE IndexTestDB_Backup
GO

DROP TABLE MyTable
GO

CREATE TABLE MyTable
(
	[ProductId]		varchar(06)			NOT NULL,
	[TxDate]		[decimal](8, 0)		NOT NULL,
	[Qty]			[decimal](13, 0)	NULL,
	[Amt]			[decimal](16, 0)	NULL,
	[Mark01]		[varchar](1)		NULL,	-- Y/N
	[Mark02]		[varchar](1)		NULL,	-- Y/N
	[Mark03]		[varchar](1)		NULL,	-- Y/N
	[Mark04]		[varchar](1)		NULL,	-- Y/N
	[Mark05]		[varchar](1)		NULL,	-- Y/N
	[Price01]		[decimal](10, 4)	NULL,
	[Price02]		[decimal](10, 4)	NULL,
	[Price03]		[decimal](10, 4)	NULL,
	[Price04]		[decimal](10, 4)	NULL,
	[Price05]		[decimal](10, 4)	NULL,
	[Discount01]	[decimal](3, 2)		NULL,	-- 0.00 ~ 1.00
	[Discount02]	[decimal](3, 2)		NULL,	-- 0.00 ~ 1.00
	[Discount03]	[decimal](3, 2)		NULL,	-- 0.00 ~ 1.00
	[Discount04]	[decimal](3, 2)		NULL,	-- 0.00 ~ 1.00
	[Discount05]	[decimal](3, 2)		NULL,	-- 0.00 ~ 1.00
	[Remark]		[nvarchar](64)		NULL,
	CONSTRAINT PK_MyTable PRIMARY KEY (ProductId, TxDate)
)
GO
