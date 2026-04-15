
USE PC_Sales;
GO

DROP TABLE IF EXISTS FACT_PC_SALES;

CREATE TABLE FACT_PC_SALES (
    

    SalesID                 INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID          INT NOT NULL,
    Date_Key              INT NOT NULL,
    ShopID              INT NOT NULL,
    ProductID           INT NOT NULL,
    PriorityID         INT NOT NULL,
    ChannelID          INT NOT NULL,
    Payment_MethodID    INT NOT NULL,
    LocationID          INT NOT NULL,

    -- Measures / Numeric Facts (from your raw data)
    Cost_Price            DECIMAL(18,2) NULL,
    Sale_Price            DECIMAL(18,2) NULL,
    Discount_Amount       DECIMAL(18,2) NULL,
    Profit                DECIMAL(18,2) NULL,          
    Finance_Amount        DECIMAL(18,2) NULL,
    Cost_of_Repairs       DECIMAL(18,2) NULL,
    Total_Sales_per_Employee DECIMAL(18,2) NULL,
    PC_Market_Price       DECIMAL(18,2) NULL,
    Credit_Score          INT NULL,                      

    );


SELECT TOP 10 * FROM FACT_PC_SALES;


USE PC_Sales;
GO

INSERT INTO FACT_PC_SALES (
    CustomerID,          
    Date_Key,
    ShopID,
    ProductID,
    PriorityID,
    ChannelID,
    Payment_MethodID,
    LocationID,
    Cost_Price,
    Sale_Price,
    Discount_Amount,
    Profit,
    Finance_Amount,
    Cost_of_Repairs,
    Total_Sales_per_Employee,
    PC_Market_Price,
    Credit_Score
)


FROM dbo.pc_data_raw r
LEFT JOIN DIM_CUSTOMER c 
    ON c.Customer_Name = r.Customer_Name 
    AND c.Customer_Surname = r.Customer_Surname 
    AND c.Customer_Email_Address = r.Customer_Email_Address

LEFT JOIN DIM_DATE d 
    ON d.Purchase_Date = r.Purchase_Date 
    AND d.Ship_Date = r.Ship_Date

LEFT JOIN DIM_SHOP s 
    ON s.Shop_Name = r.Shop_Name

LEFT JOIN DIM_PRODUCT p 
    ON p.PC_Make = r.PC_Make 
    AND p.PC_Model = r.PC_Model 
    AND p.Storage_Type = r.Storage_Type 
    AND p.RAM = r.RAM 
    AND p.Storage_Capacity = r.Storage_Capacity

LEFT JOIN DIM_PRIORITY pr 
    ON pr.Priority = r.Priority

LEFT JOIN DIM_CHANNEL ch 
    ON ch.Channel = r.Channel

LEFT JOIN DIM_PAYMENT_METHOD pm 
    ON pm.Payment_Method = r.Payment_Method

LEFT JOIN DIM_LOCATION l 
    ON l.Continent = r.Continent 
    AND l.Country_or_State = r.Country_or_State 
    AND l.Province_or_City = r.Province_or_City;
