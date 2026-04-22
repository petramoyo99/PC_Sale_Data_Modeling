DIMENSION VIEWS


 DIM_CHANNEL
CREATE VIEW vw_DIM_CHANNEL AS
SELECT 
    Channel_ID,
    Channel
FROM dbo.DIM_CHANNEL;
 DIM_PAYMENT_METHOD
CREATE VIEW vw_DIM_PAYMENT_METHOD AS
SELECT 
    Payment_Method_ID,
    Payment_Method
FROM dbo.DIM_PAYMENT_METHOD;
 DIM_PRIORITY
CREATE VIEW vw_DIM_PRIORITY AS
SELECT 
    Priority_ID,
    Priority
FROM dbo.DIM_PRIORITY;
 DIM_DATE
CREATE VIEW vw_DIM_DATE AS
SELECT 
    Date_ID,
    Ship_Date
FROM dbo.DIM_Date;
 DIM_CUSTOMER
CREATE VIEW vw_DIM_CUSTOMER AS
SELECT 
    Customer_ID,
    Customer_Name,
    Customer_Surname,
    Customer_Email_Address
FROM dbo.DIM_CUSTOMER;
 DIM_SHOP
CREATE VIEW vw_DIM_SHOP AS
SELECT 
    Shop_ID,
    Shop_Name,
    Shop_Age
FROM dbo.DIM_SHOP;
 DIM_PRODUCT
CREATE VIEW vw_DIM_PRODUCT AS
SELECT 
    Product_ID,
    PC_Make,
    PC_Model,
    Storage_Type,
    RAM
FROM dbo.DIM_PRODUCT;
 DIM_LOCATION
CREATE VIEW vw_DIM_LOCATION AS
SELECT 
    Location_ID,
    Continent,
    Country_or_State,
    Province_or_City
FROM dbo.DIM_LOCATION;

