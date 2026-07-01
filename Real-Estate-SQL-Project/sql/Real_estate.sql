-- Check tables
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name ='sales_data';

-- Cleaning columns names 
ALTER TABLE sales_data
RENAME COLUMN "xrDeedID" TO deed_id;

ALTER TABLE sales_data
RENAME COLUMN "xrSalesValidityID" TO sales_validity_id;

ALTER TABLE sales_data
RENAME COLUMN "xrCompositeLandUseID" TO composite_land_use_id;

ALTER TABLE sales_data
RENAME COLUMN "xrBuildingTypeID" TO building_type_id;

ALTER TABLE sales_data
RENAME COLUMN "xrPrimaryNeighborhoodID" TO primary_neighborhood_id;

-- Create Columns for Analysis
ALTER TABLE sales_data 
ADD COLUMN Full_Name TEXT;
UPDATE sales_data
SET Full_Name = "OwnerFirstName"||' '||"OwnerLastName"

-- Highest Avg  home sale price per Neighbourhood 

-- Get the Years
ALTER TABLE sales_data
ADD COLUMN ListYear INTEGER;
UPDATE sales_data
SET ListYear = EXTRACT(YEAR FROM "SaleDate"::timestamp)::int;

-- CTE Pipeline 

-- CTE for years
WITH RECURSIVE years AS (
    SELECT MIN(ListYear) AS start_year
    FROM sales_data

    UNION ALL

    SELECT start_year + 1
    FROM years
    WHERE start_year < (
        SELECT MAX(ListYear)
        FROM sales_data
    )
),

--CTE for neighbourhoods
neighborhoods AS (
    SELECT DISTINCT "primary_neighborhood_id"
    FROM sales_data
),


-- CTE for grid with each neighbourhood and year combination 
yearly_neighborhood_grid AS (
    SELECT
        y.start_year,
        n."primary_neighborhood_id"
    FROM years y
    CROSS JOIN neighborhoods n
),

-- CTE for sales per neighbourhood 

yearly_neighborhood_sales AS (
    SELECT
        ListYear AS sale_year,
        "primary_neighborhood_id",
        COUNT(*) AS total_transactions,
        SUM("SalePrice") AS total_sales_value,
        AVG("SalePrice") AS avg_sales_value
    FROM sales_data
    GROUP BY
        ListYear,
        "primary_neighborhood_id"
)

-- Final table with highest sales per neighbourhood
SELECT
    g.start_year,
    g."primary_neighborhood_id",
    COALESCE(s.total_transactions, 0) AS total_transactions,
    COALESCE(s.total_sales_value, 0) AS total_sales_value,
    COALESCE(s.avg_sales_value, 0) AS avg_sales_value
FROM yearly_neighborhood_grid g
LEFT JOIN yearly_neighborhood_sales s
    ON g.start_year = s.sale_year
   AND g."primary_neighborhood_id" = s."primary_neighborhood_id"
ORDER BY
    g."primary_neighborhood_id",
    g.start_year;