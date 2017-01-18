USE master
GO

SET STATISTICS XML OFF
SET STATISTICS IO OFF
SET NOCOUNT ON
GO

-- -----------------------------
-- IndexTestDB
-- -----------------------------
IF DB_ID('IndexTestDB') IS NOT NULL
BEGIN
     ALTER DATABASE IndexTestDB
     SET SINGLE_USER WITH ROLLBACK IMMEDIATE
     DROP DATABASE IndexTestDB
END
GO

CREATE DATABASE IndexTestDB
ON  PRIMARY 
    ( NAME = N'IndexTestDB'
	, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\IndexTestDB.mdf'
	, SIZE = 500MB 
	, MAXSIZE = UNLIMITED
	, FILEGROWTH = 200MB )
LOG ON 
    ( NAME = N'IndexTestDB_log'
	, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\IndexTestDB_log.ldf' 
	, SIZE = 100MB
	, MAXSIZE = UNLIMITED
	, FILEGROWTH = 50MB )
GO

ALTER DATABASE IndexTestDB
SET RECOVERY SIMPLE
GO

-- -----------------------------
-- IndexTestDB_Backup
-- -----------------------------
IF DB_ID('IndexTestDB_Backup') IS NOT NULL
BEGIN
     ALTER DATABASE IndexTestDB_Backup
     SET SINGLE_USER WITH ROLLBACK IMMEDIATE
     DROP DATABASE IndexTestDB_Backup
END
GO

CREATE DATABASE IndexTestDB_Backup
ON  PRIMARY 
    ( NAME = N'IndexTestDB_Backup'
	, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\IndexTestDB_Backup.mdf'
	, SIZE = 500MB 
	, MAXSIZE = UNLIMITED
	, FILEGROWTH = 200MB )
LOG ON 
    ( NAME = N'IndexTestDB_Backup_log'
	, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\IndexTestDB_Backup_log.ldf' 
	, SIZE = 100MB
	, MAXSIZE = UNLIMITED
	, FILEGROWTH = 50MB )
GO

ALTER DATABASE IndexTestDB
SET RECOVERY SIMPLE
GO

