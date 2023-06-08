**Video Game Sales Analysis**

This repository contains a data analysis project that aims to analyze sales data of videos games that have sold greater than 100,000 copies, obtained from Kaggle. The project focuses on answering various queries related to video game sales, platform popularity, genre performance, sales evolution over time, top publishers, regional sales differences, and games with the highest global sales. The analysis is performed using MySQL for querying the data and Power BI for data visualization.

**Software**

- MySQL: for data querying 
- PowerBI: for data visualisation

**Dataset**

The dataset used for this project can be sourced from Kaggle at the following link: <a href="https://www.kaggle.com/datasets/gregorut/videogamesales" target="_blank">Video Game Sales Data</a>. It consists of a list of video games with sales greater than 100,000 copies.

**Data Analysis Questions**

The project aims to answer the following questions through data analysis:

- Query 1: Which platforms have the most games with sales greater than 100,000 copies?
- Query 2: How does the sales performance vary across different genres?
- Query 3: How have sales evolved over time based on genre?
- Query 4: What are the top publishers based on sales?
- Query 5: How do sales differ across regions over time?
- Query 6: Which games have the highest global sales?
- Query 7: What is the distribution of sales across regions?

**Power BI Dashboard**

The project includes a Power BI dashboard that provides visual representations of the analyzed data. Here is an overview of the dashboard components:

- Total Sales Over Time: A line graph comparing total sales over time across different regions.
- Top Games: A bar graph showcasing the top-selling games based on sales.
- Top Publishers: A bar graph illustrating the top publishers based on sales.
- Top Platforms: A bar graph displaying the platforms with the most games exceeding 100,000 copies in sales.
- Genre Sales Over Time: An interactive bar graph and line graph combination representing the total sales of genres and their respective sales by year.

![image](https://github.com/ericjeongg/data-analysis-projects/assets/122524536/96832554-0a44-4ee4-81a9-2013c2f6ad2a)

**Repository Contents**

The repository contains the following files and folders:

- vgs-query-export: A folder that holds CSV files of the SQL query outputs used for the Power BI visualizations.
- vgs-queries.sql: A MySQL file that contains the SQL queries used to extract and analyze the video game sales data.
- vgs-dashboard.pbix: A Power BI file that contains the screenshotted dashboard.
- vgs-dataset.csv: A CSV file that contains the video game sales dataset obtained from Kaggle.
- vgs-dashboard-ss.png: A PNG file that contains a screenshot of the Power BI dashboard.

Feel free to explore the files and folders to gain a comprehensive understanding of the project's implementation.

Note: It is recommended to have MySQL and Power BI installed to replicate and explore the project locally.
