# 🏡 Real Estate Sales Analysis with SQL, Python & PostgreSQL

## Project Overview

This project demonstrates an end-to-end data analytics workflow using **Python**, **PostgreSQL**, and **SQL** to analyze real estate sales data.

The project begins with a raw CSV dataset, performs ETL (Extract, Transform, Load) using Python, loads the cleaned data into PostgreSQL, and uses SQL to answer business questions through exploratory analysis, aggregations, Common Table Expressions (CTEs), and advanced SQL techniques.

Future work includes connecting the PostgreSQL database to **Power BI** for interactive dashboards.

---

# 🏡 Real Estate Sales Analysis with SQL, Python & PostgreSQL

## Project Overview

This project demonstrates an end-to-end data analytics workflow using **Python** for ETL, **PostgreSQL** as the database, and **SQL** for data cleaning and business analysis.

The project imports raw real estate sales data, performs data cleaning and transformation, loads the data into PostgreSQL, and answers business questions using SQL.

---

## Dataset

**Dataset:** Real Estate Sales (10/01/2020 to Current)

**Source:** U.S. Government Open Data (Data.gov)

https://catalog.data.gov/dataset/real-estate-sales-10012020-to-current

**Description**

The dataset contains residential real estate sales transactions, including:

- Sale Date
- Sale Price
- Town
- Property Type
- Residential Type
- Assessed Value
- Sales Ratio
- Address
- Neighborhood Information

The dataset is publicly available and is maintained through Data.gov.

--

## Tech Stack

- Python
- Pandas
- PostgreSQL
- pgAdmin
- SQLAlchemy
- Jupyter Notebook
- Git & GitHub
- Power BI *(coming soon)*

---

## Project Workflow

```
Raw CSV
    │
    ▼
Python ETL
    │
    ▼
PostgreSQL Database
    │
    ▼
Data Cleaning
    │
    ▼
SQL Analysis
    │
    ▼
Business Insights
    │
    ▼
Power BI Dashboard
```

---

## ETL Process

The ETL notebook performs the following tasks:

- Reads the raw CSV dataset using Pandas
- Removes duplicate records
- Handles missing values
- Creates additional analytical columns (e.g., `ListYear`)
- Connects to PostgreSQL using SQLAlchemy
- Loads the cleaned dataset into PostgreSQL

---

## SQL Skills Demonstrated

This project includes examples of:

- Data Cleaning
- Aggregations
- GROUP BY
- ORDER BY
- HAVING
- CASE Statements
- Common Table Expressions (CTEs)
- Recursive CTEs
- CROSS JOIN
- LEFT JOIN
- COALESCE
- Date Functions
- Aggregate Functions
- Business-Oriented SQL Analysis

Additional SQL techniques such as Window Functions and Views will be added in future updates.

---

## Project Structure

```
Real-Estate-SQL-Project/

├── data/
│   └── Real_Estate_Sales.csv
│
├── notebooks/
│   └── Real_Estate_ETL.ipynb
│
├── sql/
│   ├── 01_schema_cleanup.sql
│   ├── 02_analysis.sql
│   └── 03_recursive_cte.sql
│
├── dashboard/
│   └── (Power BI files)
│
├── images/
│   └── (Screenshots and diagrams)
│
└── README.md
```

---

## Example Business Questions

Some of the questions explored include:

- Which neighborhoods have the highest average sale price?
- How have property sales changed year over year?
- Which neighborhoods have experienced the highest transaction volume?
- What are the yearly trends in average sale prices?
- How can recursive CTEs be used to generate reporting timelines?

---

## Future Improvements

- Build interactive Power BI dashboards
- Add Window Function examples
- Create SQL Views for reporting
- Optimize queries using indexes
- Automate ETL pipeline

---

## Author

**Aditya Ozarkar**

GitHub: https://github.com/aozarkar1