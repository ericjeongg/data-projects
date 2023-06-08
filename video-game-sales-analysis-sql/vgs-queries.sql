-- Video Game Sales Queries

-- Reference database
USE projects;
-- Drop existing table if necessary
-- DROP TABLE vgs;
-- Create a copy of original table to manipulate and do analysis on
create table vgs AS
	SELECT * FROM videogamesales;
    
SELECT * FROM vgs;

-- Query 1: Which platforms have the most games with sales greater than 100,000 copies?
SELECT platform,
	COUNT(*) as count
FROM vgs
GROUP BY platform
ORDER BY count DESC;
-- Visualize the distribution of games by platform using a bar chart or a treemap.

-- Query 2: How does the sales performance vary across different genres?
SELECT  
	Genre,
    ROUND(SUM(NA_Sales), 2) as NA_Sales,
    ROUND(SUM(EU_Sales), 2) as EU_Sales,
    ROUND(SUM(JP_Sales), 2) as JP_Sales,
    ROUND(SUM(Other_Sales), 2) as Other_Sales,
    ROUND(SUM(Global_Sales), 2) as Total_Sales,
    (CASE
        WHEN SUM(NA_Sales) > SUM(EU_Sales) AND SUM(NA_Sales) > SUM(JP_Sales) THEN 'NA'
        WHEN SUM(EU_Sales) > SUM(NA_Sales) AND SUM(EU_Sales) > SUM(JP_Sales) THEN 'EU'
        WHEN SUM(JP_Sales) > SUM(NA_Sales) AND SUM(JP_Sales) > SUM(EU_Sales) THEN 'JP'
		ELSE 'Other'
     END) as Highest
FROM vgs
GROUP BY Genre
ORDER BY Total_Sales desc;
-- Create a stacked column chart to compare sales by genre, with different colors representing different regions (North America, Europe, Japan, and rest of the world).

-- Query 3: How have sales evolved over time based on genre?
SELECT Year, genre, ROUND(SUM(Global_Sales), 2) AS Total_Sales
FROM vgs
GROUP BY Year, genre
ORDER BY Year;
-- Use a line chart to show the trend of global sales over the years, with a filter for selecting specific genres.

-- Query 4: What are the top publishers based on sales?
SELECT publisher, ROUND(SUM(Global_Sales), 2) AS Total_Sales
FROM vgs
GROUP BY publisher
ORDER BY Total_Sales desc;
-- Display the top publishers by sales using a horizontal bar chart or a donut chart.

-- Query 5: How do sales differ across regions over time?
SELECT  
	year,
    ROUND(SUM(NA_Sales), 2) as NA_Sales,
    ROUND(SUM(EU_Sales), 2) as EU_Sales,
    ROUND(SUM(JP_Sales), 2) as JP_Sales,
    ROUND(SUM(Other_Sales), 2) as Other_Sales,
    ROUND(SUM(Global_Sales), 2) as Total_Sales
FROM vgs
GROUP BY year
ORDER BY year;
-- Create a line graph to visualize the regional sales (North America, Europe, Japan, and rest of the world) over time.

-- Query 6: Which games have the highest global sales?
SELECT  
	Name,
    ROUND(SUM(NA_Sales), 2) as NA_Sales,
    ROUND(SUM(EU_Sales), 2) as EU_Sales,
    ROUND(SUM(JP_Sales), 2) as JP_Sales,
    ROUND(SUM(Other_Sales), 2) as Other_Sales,
    ROUND(SUM(Global_Sales), 2) as Total_Sales,
    (CASE
        WHEN SUM(NA_Sales) > SUM(EU_Sales) AND SUM(NA_Sales) > SUM(JP_Sales) THEN 'NA'
        WHEN SUM(EU_Sales) > SUM(NA_Sales) AND SUM(EU_Sales) > SUM(JP_Sales) THEN 'EU'
        WHEN SUM(JP_Sales) > SUM(NA_Sales) AND SUM(JP_Sales) > SUM(EU_Sales) THEN 'JP'
		ELSE 'Other'
     END) as Highest
FROM vgs
GROUP BY Name
ORDER BY Total_Sales desc;
-- Create a stacked column chart to compare sales by genre, with different colors representing different regions (North America, Europe, Japan, and rest of the world).

-- Query 7: What is the distribution of sales across regions?
SELECT ROUND(SUM(NA_Sales), 2) as NA_Sales,
    ROUND(SUM(EU_Sales), 2) as EU_Sales,
    ROUND(SUM(JP_Sales), 2) as JP_Sales,
    ROUND(SUM(Other_Sales), 2) as Other_Sales,
    ROUND(SUM(Global_Sales), 2) as Total_Sales
FROM vgs
Order by Total_Sales desc;
-- Use a pie chart or a stacked column chart to display the proportion of sales contributed by each region.





