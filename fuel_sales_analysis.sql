-- Data Cleaning
-- Clean and preprocess the dataset, handling missing values, outliers, and inconsistencies
-- Ensure data consistency across tables and resolve any discrepancies

-- Example:
-- Clean Sales table
UPDATE Sales
SET quantity_sold = CASE WHEN quantity_sold < 0 THEN 0 ELSE quantity_sold END,
    revenue = CASE WHEN revenue < 0 THEN 0 ELSE revenue END;

-- Exploratory Data Analysis (EDA)
-- Calculate summary statistics for key metrics such as total sales revenue, quantity sold, and inventory levels
-- Visualize daily sales trends, inventory levels over time, and customer purchasing behavior

-- Example:
-- Calculate total sales revenue and quantity sold by date
SELECT date, SUM(revenue) AS total_revenue, SUM(quantity_sold) AS total_quantity_sold
FROM Sales
GROUP BY date
ORDER BY date;

-- Sales Analysis
-- Calculate daily, weekly, and monthly sales metrics, including total revenue, quantity sold, and average transaction value
-- Identify peak sales periods, seasonal trends, and variations in sales volume by fuel type

-- Example:
-- Calculate monthly sales metrics by fuel type
SELECT 
    MONTH(date) AS month,
    fuel_type,
    SUM(revenue) AS total_revenue,
    SUM(quantity_sold) AS total_quantity_sold,
    AVG(revenue / quantity_sold) AS avg_transaction_value
FROM Sales
GROUP BY MONTH(date), fuel_type
ORDER BY month, fuel_type;

-- Inventory Management
-- Calculate inventory turnover rates and days of inventory on hand for each fuel type
-- Identify slow-moving or excess inventory items and recommend adjustments to purchasing or stocking strategies

-- Example:
-- Calculate inventory turnover rate for each fuel type
SELECT 
    fuel_type,
    SUM(quantity_sold) AS total_quantity_sold,
    AVG(beginning_inventory) AS avg_beginning_inventory,
    AVG(end_inventory) AS avg_end_inventory,
    AVG(quantity_sold) / ((AVG(beginning_inventory) + AVG(end_inventory)) / 2) AS inventory_turnover_rate
FROM Inventory
GROUP BY fuel_type;

-- Customer Analysis
-- Segment customers based on demographics, purchase frequency, and spending habits
-- Analyze customer retention rates, repeat purchase behavior, and loyalty trends

-- Example:
-- Calculate total purchases and revenue by customer
SELECT 
    customer_id,
    COUNT(*) AS total_purchases,
    SUM(amount_paid) AS total_revenue
FROM Transactions
GROUP BY customer_id
ORDER BY total_revenue DESC;

-- Visualization and Reporting
-- Create visualizations and dashboards to present key findings and insights
-- Prepare a comprehensive report summarizing the analysis results, including actionable recommendations for optimizing sales, inventory management, and customer engagement

-- Example:
-- Visualize monthly sales trends by fuel type
SELECT 
    MONTH(date) AS month,
    fuel_type,
    SUM(revenue) AS total_revenue
FROM Sales
GROUP BY MONTH(date), fuel_type
ORDER BY month, fuel_type;
