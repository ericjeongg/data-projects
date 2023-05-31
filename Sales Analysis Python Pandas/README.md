**Sales Analysis Python Project**

Set of real world data science tasks completed using the Python Pandas library. The project was originally created by Keith Galli (GitHub: KeithGalli). 
The data sets used in this project were provided and include sales data for each month of the year, separated into separate CSV files. The data contains hundreds of thousands of electronics store purchases, broken down by month, product type, cost, purchase address, and other relevant information.

**Data Cleaning**
Before conducting the analysis, the sales data underwent a series of cleaning steps to ensure the quality and consistency of the data. The following data cleaning steps were performed:
- Removing NaN Entries: Any rows or entries with missing or null values were removed from the dataset to ensure accurate analysis.
- Verifying Data Completeness: The data was checked to ensure that all the necessary columns and information required for analysis were present. In case of missing data, appropriate actions were taken to either fill in the missing values or exclude the incomplete records.
- Removing Duplicate Columns: If any duplicate columns were found, they were removed to avoid redundancy and improve data efficiency.
- Converting Column Data Types: Data types of specific columns were adjusted to ensure compatibility with the analysis methods and accurate calculations. For example, converting strings to datetime objects for time-based analysis or converting cost values to numeric types.
- Adding Relevant Columns: Additional columns were added to the dataset to facilitate the analysis of specific questions. These columns might include calculated values or derived features that provide insights into the sales data.

**Analysis Questions**
The project aimed to answer several key questions about the sales data. The following analysis questions were addressed:
- Question 1: What was the best month of sales? How much was earned that month?
- Question 2: What city had the highest number of sales?
- Question 3: What time should we display advertisements to maximize the likelihood of customers buying a product?
- Question 4: What pairs of products are most often sold together?
- Question 5: What product sold the most? Why do you think it sold the most?

**Methods Used **
To solve these analysis questions, the project utilized the following methods and libraries:
- Pandas: The Pandas library was used to read and combine the separate CSV data files into a single dataset, as well as for data frame manipulation and analysis. It provided efficient and powerful tools for data cleaning, transformation, and aggregation.
- Counter and combinations: The Counter class from the collections module and the combinations function from the itertools module were imported to assist in counting pairs of combinations within a list. These functionalities were used to analyze the frequently sold product pairs.
- Matplotlib: The Matplotlib library was used for data visualization purposes. It provided a wide range of plotting functions to create informative charts and graphs that helped in understanding the sales data and presenting the analysis results effectively.

**How to Use**
To use the Sales Analysis Python project, please follow these steps:
- Download the data files from the provided source or visit Keith Galli's GitHub repository (KeithGalli/Pandas-Data-Science-Tasks) to find the original files.
- Open up Jupyter Notebook or any Python environment of your choice.
- Navigate to the directory where you have the Sales Analysis project files.
- Open the Sales Analysis file (e.g., Sales Analysis.ipynb) in your Python environment, ensuring that the folder with the data CSV files is in the same directory.
- Execute the code cells in order in the notebook or run the Python script to perform the analysis.
- Review the generated visualizations and analysis outputs to gain insights into the sales data and find answers to the provided analysis questions.
By following these steps, you can easily set up and run the Sales Analysis Python project on your local machine, allowing you to explore the provided sales data and derive meaningful insights from it.
