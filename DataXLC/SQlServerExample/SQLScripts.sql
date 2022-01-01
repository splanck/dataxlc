USE [master]
GO

-- Create xlcuser account to be used by the C# application to connect to SQL Server.
CREATE LOGIN [xlcuser] WITH PASSWORD=N'xlcpassword', DEFAULT_DATABASE=[master], 
DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [xlcuser] ENABLE
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [xlcuser]
GO

-- Create example DataXLC database
CREATE DATABASE [DataXLC] ON PRIMARY 
( NAME = N'DataXLC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dataxlc.mdf' 
, SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataXLC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dataxlc_log.ldf' 
, SIZE = 8192KB , FILEGROWTH = 65536KB )
GO

-- Create tblusers example table.
USE [DataXLC]
GO

CREATE TABLE [dbo].[tblUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

