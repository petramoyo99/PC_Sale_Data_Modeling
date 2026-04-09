--CREATING DATBASE
CREATE DATABASE PC_Sales;

select * from PC_Sales.dbo.pc_data_raw;

--CREATING DIMENSION TABLES

--CREATING DIM_CUSTOMER TABLE 1
Select distinct
Customer_Name,
Customer_Surname,
Customer_Contact_Number,
Customer_Email_Address
into DIM_CUSTOMER
from PC_Sales.dbo.pc_data_raw;

--CREATING DIM_Date TABLE 2

SELECT DISTINCT
Purchase_Date
ShIP_Date
INTO DIM_Date
FROM PC_Sales.dbo.pc_data_raw;

--CREATING DIM_SHOP TABLE 3

SELECT DISTINCT
Shop_Name,
Shop_Age
INTO DIM_SHOP
FROM PC_Sales.dbo.pc_data_raw;

--CREATING DIM_PRODUCT TABLE 4

SELECT DISTINCT
PC_Make,
PC_Model,
Storage_Type,
RAM,
Storage_Capacity
INTO DIM_PRODUCT
FROM PC_Sales.dbo.pc_data_raw;

--CREATING DIM_PRIORITY TABLE 5


SELECT DISTINCT
Priority
INTO DIM_PRIORITY
FROM PC_Sales.dbo.pc_data_raw;

--CREATING DIM_CHANNEL TABLE 6

SELECT DISTINCT
Channel
INTO DIM_CHANNEL
FROM PC_Sales.dbo.pc_data_raw;

--CREATING DIM_PAYMENT_METHOD TABLE 7

SELECT DISTINCT
Payment_Method
INTO DIM_PAYMENT_METHOD
FROM PC_Sales.dbo.pc_data_raw;

--CREATING DIM_LOCATION TABLE 8

SELECT DISTINCT
Continent,
Country_or_State,
Province_or_City
INTO DIM_LOCATION
FROM PC_Sales.dbo.pc_data_raw;