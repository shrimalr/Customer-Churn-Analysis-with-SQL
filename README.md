# SQL Customer Churn Analysis

## Project Overview

This project provides a comprehensive analysis of customer churn for a subscription-based business. By leveraging advanced SQL techniques, I've analyzed a mock dataset to identify key drivers of customer attrition.

## Skills Demonstrated

* **Database Management:** Schema design, table creation, and data loading.
* **Data Cleaning & Preprocessing:** Handling `NULL` values and transforming data.
* **Feature Engineering:** Creating new metrics like customer tenure and total spend.
* **Complex Queries:** Utilizing **`Common Table Expressions (CTEs)`** for modular and readable code.
* **Window Functions:** Applying **`NTILE()`**, **`ROW_NUMBER()`**, and `PARTITION BY` for ranking and segmentation.
* **Data Analysis:** Conducting in-depth exploratory data analysis (EDA) to derive actionable insights.
* **Joins:** Using `LEFT JOIN` and `INNER JOIN` to combine data from multiple tables.

## Key Findings & Insights

* **Customer Tenure:** Churned customers had a 25% shorter average subscription tenure compared to active customers.
* **Support Interactions:** Customers with a higher number of support tickets and a lower resolution rate were more likely to churn.
* **Revenue Impact:** While churned customers contribute less in total revenue, retaining high-spending customers is crucial, as they have a significantly lower churn rate.

## Project Structure

* `data/`: Contains the SQL script for creating tables and populating them with mock data.
* `sql/`: Stores all the SQL scripts used for the analysis, broken down by task.
* `visualizations/`: Includes screenshots of key findings visualized in a tool like Tableau or Power BI.

## How to Run the Project

1.  **Clone this repository:** `git clone [your-repository-link]`
2.  **Load Data:** Run the `data/mock_data.sql` script to set up the tables and populate them.
3.  **Run Analysis:** Execute the scripts in the `sql/` folder in numerical order to replicate the analysis.
4.  **Visualize:** Use the results from `03_exploratory_data_analysis.sql` and `04_advanced_analysis.sql` to create visualizations in your preferred BI tool.

*Feel free to connect with me on LinkedIn to discuss this project further!*
