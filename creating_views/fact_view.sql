CREATE VIEW vw_FACT_PC_SALES AS
SELECT 
    f.SalesID,

    -- Customer
    c.Customer_Name,
    c.Customer_Surname,
    c.Customer_Email_Address,

    -- Date
    d.Ship_Date,

    -- Shop
    s.Shop_Name,

    -- Product
    p.PC_Make,
    p.PC_Model,
    p.Storage_Type,
    p.RAM,

    -- Other Dimensions
    pr.Priority,
    ch.Channel,
    pm.Payment_Method,

    -- Location
    l.Continent,
    l.Country_or_State,
    l.Province_or_City,

    -- Measures
    f.Cost_Price,
    f.Sale_Price,
    f.Discount_Amount,
    f.Profit,
    f.Finance_Amount,
    f.Cost_of_Repairs,
    f.Total_Sales_per_Employee,
    f.PC_Market_Price,
    f.Credit_Score

FROM FACT_PC_SALES f

LEFT JOIN DIM_CUSTOMER c 
    ON f.CustomerID = c.Customer_ID

LEFT JOIN DIM_DATE d 
    ON f.Date_Key = d.Date_ID

LEFT JOIN DIM_SHOP s 
    ON f.ShopID = s.Shop_ID

LEFT JOIN DIM_PRODUCT p 
    ON f.ProductID = p.Product_ID

LEFT JOIN DIM_PRIORITY pr 
    ON f.PriorityID = pr.Priority_ID

LEFT JOIN DIM_CHANNEL ch 
    ON f.ChannelID = ch.Channel_ID

LEFT JOIN DIM_PAYMENT_METHOD pm 
    ON f.Payment_MethodID = pm.Payment_Method_ID

LEFT JOIN DIM_LOCATION l 
    ON f.LocationID = l.Location_ID;