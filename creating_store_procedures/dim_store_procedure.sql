
USE PC_Sales;
GO

CREATE PROCEDURE sp_Load_DIM_CHANNEL
AS
BEGIN
    INSERT INTO dbo.DIM_CHANNEL (Channel)
    SELECT DISTINCT Channel
    FROM dbo.pc_data_raw r
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dbo.DIM_CHANNEL d
        WHERE d.Channel = r.Channel
    );
END;


CREATE PROCEDURE sp_Load_DIM_PAYMENT_METHOD
AS
BEGIN
    INSERT INTO dbo.DIM_PAYMENT_METHOD (Payment_Method)
    SELECT DISTINCT Payment_Method
    FROM dbo.pc_data_raw r
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dbo.DIM_PAYMENT_METHOD d
        WHERE d.Payment_Method = r.Payment_Method
    );
END;


CREATE PROCEDURE sp_Load_DIM_PRIORITY
AS
BEGIN
    INSERT INTO dbo.DIM_PRIORITY (Priority)
    SELECT DISTINCT Priority
    FROM dbo.pc_data_raw r
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dbo.DIM_PRIORITY d
        WHERE d.Priority = r.Priority
    );
END;


CREATE PROCEDURE sp_Load_DIM_DATE
AS
BEGIN
    INSERT INTO dbo.DIM_Date (Ship_Date)
    SELECT DISTINCT Ship_Date
    FROM dbo.pc_data_raw r
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dbo.DIM_Date d
        WHERE d.Ship_Date = r.Ship_Date
    );
END;


CREATE PROCEDURE sp_Load_DIM_CUSTOMER
AS
BEGIN
    INSERT INTO dbo.DIM_CUSTOMER 
    (Customer_Name, Customer_Surname, Customer_Contact_Number, Customer_Email_Address)
    SELECT DISTINCT 
        Customer_Name, 
        Customer_Surname, 
        Customer_Contact_Number, 
        Customer_Email_Address
    FROM dbo.pc_data_raw r
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dbo.DIM_CUSTOMER d
        WHERE d.Customer_Email_Address = r.Customer_Email_Address
    );
END;


CREATE PROCEDURE sp_Load_DIM_SHOP
AS
BEGIN
    INSERT INTO dbo.DIM_SHOP (Shop_Name, Shop_Age)
    SELECT DISTINCT Shop_Name, Shop_Age
    FROM dbo.pc_data_raw r
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dbo.DIM_SHOP d
        WHERE d.Shop_Name = r.Shop_Name
    );
END;


CREATE PROCEDURE sp_Load_DIM_PRODUCT
AS
BEGIN
    INSERT INTO dbo.DIM_PRODUCT (PC_Make, PC_Model, Storage_Type, RAM)
    SELECT DISTINCT PC_Make, PC_Model, Storage_Type, RAM
    FROM PC_Sales.dbo.pc_data_raw
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dbo.DIM_PRODUCT d
        WHERE d.PC_Make = r.PC_Make
          AND d.PC_Model = r.PC_Model
          AND d.Storage_Type = r.Storage_Type
          AND d.RAM = r.RAM
    );
END;



CREATE PROCEDURE sp_Load_DIM_LOCATION
AS
BEGIN
    INSERT INTO dbo.DIM_LOCATION (Continent, Country_or_State, Province_or_City)
    SELECT DISTINCT Continent, Country_or_State, Province_or_City
    FROM dbo.pc_raw_data
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dbo.DIM_LOCATION d
        WHERE d.Continent = r.Continent
          AND d.Country_or_State = r.Country_or_State
          AND d.Province_or_City = r.Province_or_City
    );
END;




EXEC sp_Load_DIM_CHANNEL;
EXEC sp_Load_DIM_PAYMENT_METHOD;
EXEC sp_Load_DIM_PRIORITY;
EXEC sp_Load_DIM_DATE;
EXEC sp_Load_DIM_CUSTOMER;
EXEC sp_Load_DIM_SHOP;
EXEC sp_Load_DIM_PRODUCT;
EXEC sp_Load_DIM_LOCATION;
