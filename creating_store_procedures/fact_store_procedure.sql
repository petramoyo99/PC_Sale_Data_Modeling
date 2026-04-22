CREATE PROCEDURE sp_Load_FACT_PC_SALES
AS
BEGIN

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
    SELECT 
        c.Customer_ID,
        d.Date_ID,
        s.Shop_ID,
        p.Product_ID,
        pr.Priority_ID,
        ch.Channel_ID,
        pm.Payment_Method_ID,
        l.Location_ID,

        r.Cost_Price,
        r.Sale_Price,
        r.Discount_Amount,
        r.Profit,
        r.Finance_Amount,
        r.Cost_of_Repairs,
        r.Total_Sales_per_Employee,
        r.PC_Market_Price,
        r.Credit_Score

    FROM PC_Sales.dbo.pc_data_raw r

    LEFT JOIN DIM_CUSTOMER c 
        ON c.Customer_Name = r.Customer_Name 
        AND c.Customer_Surname = r.Customer_Surname 
        AND c.Customer_Email_Address = r.Customer_Email_Address

    LEFT JOIN DIM_DATE d 
        ON d.Ship_Date = r.Ship_Date  

    LEFT JOIN DIM_SHOP s 
        ON s.Shop_Name = r.Shop_Name

    LEFT JOIN DIM_PRODUCT p 
        ON p.PC_Make = r.PC_Make 
        AND p.PC_Model = r.PC_Model 
        AND p.Storage_Type = r.Storage_Type 
        AND p.RAM = r.RAM             

    LEFT JOIN DIM_PRIORITY pr 
        ON pr.Priority = r.Priority

    LEFT JOIN DIM_CHANNEL ch 
        ON ch.Channel = r.Channel

    LEFT JOIN DIM_PAYMENT_METHOD pm 
        ON pm.Payment_Method = r.Payment_Method

    LEFT JOIN DIM_LOCATION l 
        ON l.Continent = r.Continent 
        AND l.Country_or_State = r.Country_or_State 
        AND l.Province_or_City = r.Province_or_City

    --  Preventing  duplicates
    WHERE NOT EXISTS (
        SELECT 1
        FROM FACT_PC_SALES f
        WHERE f.CustomerID = c.Customer_ID
          AND f.Date_Key = d.Date_ID
          AND f.ProductID = p.Product_ID
    );

END;