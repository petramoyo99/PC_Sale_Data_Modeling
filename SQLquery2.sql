USE [PC_Sales]
GO

/****** Object:  Table [dbo].[DIM_CHANNEL]    Script Date: 2026/04/10 00:06:24 ******/


--- DIM_CHANNELID TABLE CREATION 1

DROP TABLE [PC_Sales].[dbo].[DIM_CHANNEL] 
CREATE TABLE [dbo].[DIM_CHANNEL](
Channel_ID INT IDENTITY(1,1) PRIMARY KEY,
	[Channel] [nvarchar](50) NOT NULL
) 

INSERT INTO [dbo].[DIM_CHANNEL] (Channel)
SELECT DISTINCT Channel
FROM [PC_Sales].[dbo].[pc_data_raw]


SELECT * FROM [PC_Sales].[dbo].[DIM_CHANNEL]


--CREATING DIM_PAYMENTID2

DROP TABLE [PC_Sales].[dbo].[DIM_PAYMENT_METHOD]
CREATE TABLE [dbo].[DIM_PAYMENT_METHOD](
Payment_Method_ID INT IDENTITY(1,1) PRIMARY KEY,
	[Payment_Method] [nvarchar](50) NOT NULL
)

INSERT INTO [dbo].[DIM_PAYMENT_METHOD] (Payment_Method)
SELECT DISTINCT Payment_Method
FROM [PC_Sales].[dbo].[pc_data_raw]

SELECT * FROM [PC_Sales].[dbo].[DIM_PAYMENT_METHOD]

--CREATING DIM_PRIORITYID 3

DROP TABLE [PC_Sales].[dbo].[DIM_PRIORITY]
CREATE TABLE [dbo].[DIM_PRIORITY](
Priority_ID INT IDENTITY(1,1) PRIMARY KEY,
	[Priority] [nvarchar](50) NOT NULL
)

INSERT INTO [dbo].[DIM_PRIORITY] (Priority)
SELECT DISTINCT Priority
FROM [PC_Sales].[dbo].[pc_data_raw]

SELECT * FROM [PC_Sales].[dbo].[DIM_PRIORITY]


--CREATING DIM_DATEID 4

DROP TABLE [PC_Sales].[dbo].[DIM_Date]
CREATE TABLE [dbo].[DIM_Date](
Date_ID INT IDENTITY(1,1) PRIMARY KEY,
	[Ship_Date] [date] NOT NULL
)

INSERT INTO [dbo].[DIM_Date] (Ship_Date)
SELECT DISTINCT Ship_Date
Purchase_Date
FROM [PC_Sales].[dbo].[pc_data_raw]

SELECT * FROM [PC_Sales].[dbo].[DIM_Date]


--CREATE TABLE DIM_CUSTOMER 5

DROP TABLE [PC_Sales].[dbo].[DIM_CUSTOMER]
CREATE TABLE [dbo].[DIM_CUSTOMER](
Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
	[Customer_Name] [nvarchar](50) NOT NULL,
	[Customer_Surname] [nvarchar](50) NOT NULL,
	[Customer_Contact_Number] [nvarchar](20) NOT NULL,
	[Customer_Email_Address] [nvarchar](50) NOT NULL
)

INSERT INTO [dbo].[DIM_CUSTOMER] (Customer_Name, Customer_Surname, Customer_Contact_Number, Customer_Email_Address)
SELECT DISTINCT Customer_Name, Customer_Surname, Customer_Contact_Number, Customer_Email_Address
FROM [PC_Sales].[dbo].[pc_data_raw]


SELECT * FROM [PC_Sales].[dbo].[DIM_CUSTOMER]


--CREATE TABLE DIM_SHOP 6

DROP TABLE [PC_Sales].[dbo].[DIM_SHOP]
CREATE TABLE [dbo].[DIM_SHOP](
Shop_ID INT IDENTITY(1,1) PRIMARY KEY,
	[Shop_Name] [nvarchar](50) NOT NULL,
	[Shop_Age] [tinyint] NOT NULL
)


INSERT INTO [dbo].[DIM_SHOP] (Shop_Name, Shop_Age)
SELECT DISTINCT Shop_Name, Shop_Age
FROM [PC_Sales].[dbo].[pc_data_raw]

SELECT * FROM [PC_Sales].[dbo].[DIM_SHOP]

--CREATE TABLE DIM_PRODUCT 7

DROP TABLE [PC_Sales].[dbo].[DIM_PRODUCT]
CREATE TABLE [dbo].[DIM_PRODUCT](
Product_ID INT IDENTITY(1,1) PRIMARY KEY,
	[PC_Make] [nvarchar](50) NOT NULL,
	[PC_Model] [nvarchar](50) NOT NULL,
	[Storage_Type] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NOT NULL,
	--[Storage_Capacity] [nvarchar](50) NOT NULL
)

INSERT INTO [dbo].[DIM_PRODUCT] (PC_Make, PC_Model, Storage_Type, RAM)
SELECT DISTINCT PC_Make, PC_Model, Storage_Type, RAM
FROM [PC_Sales].[dbo].[pc_data_raw]

SELECT * FROM [PC_Sales].[dbo].[DIM_PRODUCT]


--CREATING DIM_LOCATION 8

DROP TABLE [PC_Sales].[dbo].[DIM_LOCATION]
CREATE TABLE [dbo].[DIM_LOCATION](
Location_ID INT IDENTITY(1,1) PRIMARY KEY,
	[Continent] [nvarchar](50) NOT NULL,
	[Country_or_State] [nvarchar](50) NOT NULL,
	[Province_or_City] [nvarchar](50) NOT NULL
)

INSERT INTO [dbo].[DIM_LOCATION] (Continent, Country_or_State, Province_or_City)
SELECT DISTINCT Continent, Country_or_State, Province_or_City
FROM [PC_Sales].[dbo].[pc_data_raw]

SELECT * FROM [PC_Sales].[dbo].[DIM_LOCATION]