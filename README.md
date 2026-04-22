# PC Sales - Star Schema Data Warehouse

A clean **star schema** data warehouse designed for a PC company operating between **Africa** and **North America**.

[Data Architecture](data_architecture.png)


🚀 Project Overview

This project simulates a real-world data engineering + analytics pipeline, where raw transactional data is transformed into a clean and scalable data warehouse model.

Starting from raw CSV data, the solution:

Cleans and structures data
Builds dimension tables
Loads a centralized fact table
Enables fast analytical querying

💡 This model answers key business questions such as:

Which products generate the most profit?
Which regions perform best?
How do sales vary by channel and customer?

## 🛠️ Tools Used

![Excel](https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![Draw.io](https://img.shields.io/badge/draw.io-%23F08705?style=for-the-badge&logo=diagrams.net&logoColor=white)
![SSMS](https://img.shields.io/badge/SQL_Server_Management_Studio-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![Git Bash](https://img.shields.io/badge/Git_Bash-4F4F4F?style=for-the-badge&logo=git&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)

📊 Data Engineering Highlights

✔️ Star Schema Modeling
✔️ ETL using Stored Procedures
✔️ Data Deduplication (incremental loads)
✔️ Surrogate Keys for consistency
✔️ Analytical Views for reporting

🏗️ Star Schema Architecture
📌 Dimension Tables
dim_date
dim_customer
dim_location
dim_channel
dim_priority
dim_product
dim_shop
📌 Fact Table
fact_pc_sales

Stores measurable business metrics such as:

Revenue & Profit
Costs & Discounts
Repairs & Financing
Sales performance indicators
⚙️ Stored Procedures (ETL Layer)

This project uses SQL Server Stored Procedures to automate the data loading process.

🔹 Dimension Load Procedures

Each dimension has its own procedure that:

Extracts data from the raw table
Removes duplicates
Loads only new records

Procedures:

sp_Load_DIM_CUSTOMER
sp_Load_DIM_PRODUCT
sp_Load_DIM_LOCATION
sp_Load_DIM_CHANNEL
sp_Load_DIM_PRIORITY
sp_Load_DIM_PAYMENT_METHOD
sp_Load_DIM_DATE
sp_Load_DIM_SHOP
🧠 Fact Table Procedure
sp_Load_FACT_PC_SALES

This procedure:

Joins raw data with all dimensions
Uses surrogate keys
Ensures referential integrity
Prevents duplicate fact records
▶️ Execution Flow
EXEC sp_Load_DIM_CHANNEL;
EXEC sp_Load_DIM_PAYMENT_METHOD;
EXEC sp_Load_DIM_PRIORITY;
EXEC sp_Load_DIM_DATE;
EXEC sp_Load_DIM_CUSTOMER;
EXEC sp_Load_DIM_SHOP;
EXEC sp_Load_DIM_PRODUCT;
EXEC sp_Load_DIM_LOCATION;

EXEC sp_Load_FACT_PC_SALES;
## 🏗️ Star Schema Architecture

### Dimension Tables
- `dim_date`
- `dim_customer`
- `dim_location`
- `dim_channel`
- `dim_priority`
- `dim_product`
- `dim_shop`

### Fact Table
- `fact_pc_sales`

## 📁 Quick Shortcuts

Click any link below to open the file directly:

- 📊 **Data Architecture Diagram** → [View data_architecture.png](data_architecture.png)
- 📄 **README** → [View README.md](README.md)
- 🗄️ **Create Dimension Tables** → [creating_dim_tables.sql](creating_dim_tables.sql)
- 📈 **Create Fact Table** → [fact_pc_sales.sql](fact_pc_sales.sql)
- 📥 **Insert Sample Data** → [inserting_into.sql](inserting_into.sql)
- 📋 **Source Dataset** → [pc_data.csv](pc_data.csv)

> **Tip**: To quickly open the PNG diagram, just click the link above or the image at the top of this page.

## 📁 Full Repository Files

- `creating_dim_tables.sql`
- `fact_pc_sales.sql`
- `inserting_into.sql`
- `pc_data.csv`
- `data_architecture.png`
- `pc_data_exellmodeling.et`
📊 Data Engineering Highlights

✔️ Star Schema Modeling
✔️ ETL using Stored Procedures
✔️ Data Deduplication (incremental loads)
✔️ Surrogate Keys for consistency
✔️ Analytical Views for reporting

🏗️ Star Schema Architecture
📌 Dimension Tables
dim_date
dim_customer
dim_location
dim_channel
dim_priority
dim_product
dim_shop
📌 Fact Table
fact_pc_sales

Stores measurable business metrics such as:

Revenue & Profit
Costs & Discounts
Repairs & Financing
Sales performance indicators
⚙️ Stored Procedures (ETL Layer)

This project uses SQL Server Stored Procedures to automate the data loading process.

🔹 Dimension Load Procedures

Each dimension has its own procedure that:

Extracts data from the raw table
Removes duplicates
Loads only new records

Procedures:

sp_Load_DIM_CUSTOMER
sp_Load_DIM_PRODUCT
sp_Load_DIM_LOCATION
sp_Load_DIM_CHANNEL
sp_Load_DIM_PRIORITY
sp_Load_DIM_PAYMENT_METHOD
sp_Load_DIM_DATE
sp_Load_DIM_SHOP
🧠 Fact Table Procedure
sp_Load_FACT_PC_SALES

This procedure:

Joins raw data with all dimensions
Uses surrogate keys
Ensures referential integrity
Prevents duplicate fact records
▶️ Execution Flow
EXEC sp_Load_DIM_CHANNEL;
EXEC sp_Load_DIM_PAYMENT_METHOD;
EXEC sp_Load_DIM_PRIORITY;
EXEC sp_Load_DIM_DATE;
EXEC sp_Load_DIM_CUSTOMER;
EXEC sp_Load_DIM_SHOP;
EXEC sp_Load_DIM_PRODUCT;
EXEC sp_Load_DIM_LOCATION;

EXEC sp_Load_FACT_PC_SALES;




