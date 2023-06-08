**SQL Data Analysis Project**

This repository contains a data analysis project that focuses on exploring and analyzing employee data using SQL and visualizing the insights with Power BI. The dataset used in this project is sourced from Github@Irene-arch and includes thousands of records related to employees, such as their names, birth dates, hire dates, termination dates, job titles, and more.

**Software**

- MySQL: for data querying 
- PowerBI: for data visualisation

**Dataset**

The dataset used for this project is available in the repository as a CSV file. It provides comprehensive information about employees, enabling HR teams to gain valuable insights into various aspects of their workforce.

**Data Cleaning**

Data cleaning plays a crucial role in ensuring accurate and meaningful analysis. The following tasks were performed during the data cleaning process:

- Querying tables within the database.
- Adding/dropping tables and columns as needed.
- Renaming columns to improve clarity.
- Converting data types to ensure consistency.
- Subquerying to extract specific information.
- Ensuring data is in the same format across relevant fields.

It's important to note that all data cleaning operations were conducted on a copy of the original table to prevent any loss of the original data.

**Data Analysis Questions**

The project aimed to answer several key questions regarding the employee data. These questions provide valuable insights into different aspects of the company's workforce:

- What is the gender breakdown of employees in the company?
- What is the race/ethnicity breakdown of employees in the company?
- What is the age distribution of employees in the company?
- How many employees work at headquarters versus remote locations?
- What is the average length of employment for employees who have been terminated?
- How does the gender distribution vary across departments and job titles?
- What is the distribution of job titles across the company?
- Which department has the highest turnover rate?
- What is the distribution of employees across locations by state?
- How has the company's employee count changed over time based on hire and termination dates?
- What is the tenure distribution for each department?

**Power BI Dashboard**

To provide an intuitive and visually appealing representation of the data analysis results, a Power BI dashboard was created. The dashboard allows users to interact with the data and gain insights through various visualizations, including charts, graphs, and tables.

![image](https://github.com/ericjeongg/Data_Analysis_Projects/assets/122524536/cd872dd0-89ee-4aef-aa5a-2f091153d2d2)

**Repository Contents**

This repository includes the following files and folders:

- hr-data-cleaning.sql: SQL file containing the data cleaning operations performed on the dataset.
- hr-queries.sql: SQL file containing the queries used to extract insights from the cleaned data.
- hr-dashboard.pbix: Power BI file containing the interactive dashboard visualizing the analysis results.
- hr-dataset.csv: CSV file containing the original dataset used in this project.
- hr-query-export: Folder containing the CSV files generated from the queries for visualizations in Power BI.
- hr-dashboard-ss.png: A PNG file that contains a screenshot of the Power BI dashboard.

Feel free to explore the files and folders to gain a comprehensive understanding of the project's implementation.

Note: It is recommended to have MySQL and Power BI installed to replicate and explore the project locally.
