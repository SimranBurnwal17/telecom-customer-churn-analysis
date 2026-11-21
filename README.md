# Telecom Customer Churn Analysis

## Project Overview

This project analyses customer churn in a telecommunications company using Python, MySQL, and Power BI.

The objective is to understand customer churn patterns, identify customer segments with higher churn rates, examine the monthly charges associated with churned customers, and provide data-driven recommendations to improve customer retention.

## Business Objectives

- Understand the overall customer churn rate.
- Identify customer segments with higher churn rates.
- Analyse churn across contract types, payment methods, internet services, and tenure groups.
- Compare monthly charges between churned and retained customers.
- Examine the monthly charges associated with churned customers.
- Identify customer characteristics and combinations associated with higher churn.

## Tools and Technologies

- **Python:** Pandas, NumPy, Matplotlib, Seaborn
- **MySQL:** Data analysis, aggregations, CTEs, conditional statements, window functions
- **Power BI:** Interactive dashboards, DAX measures, data visualization
- **Jupyter Notebook:** Exploratory Data Analysis

## Project Structure

```text
telecom-customer-churn-analysis/
│
├── data/
├── notebooks/
├── sql/
├── powerbi/
├── screenshots/
├── README.md
```

## Project Workflow

### 1. Data Exploration and Cleaning – Python

- Explored the dataset using Pandas and NumPy.
- Examined data types, descriptive statistics, and missing values.
- Converted `TotalCharges` into a numeric data type.
- Identified 11 missing values after conversion and removed those records.
- Created tenure groups using 12-month intervals.
- Performed exploratory and bivariate analysis using Matplotlib and Seaborn.
- Analysed relationships between customer characteristics and churn.

### 2. SQL Analysis – MySQL

Used MySQL to investigate customer churn and revenue-related questions, including:

- Total number of customers and churn percentage.
- Churn rate by contract type.
- Churn rate by payment method.
- Churn rate by tech support.
- Ranking payment methods based on churn rate.
- Average monthly charges of churned customers.
- Monthly charges associated with churned customers.
- Revenue contribution across contract types.
- Comparison of monthly charges between churned and retained customers.

### 3. Interactive Dashboard – Power BI

Developed a three-page interactive dashboard.

**Page 1: Customer Churn Overview**
- Total customers
- Total churners
- Average monthly charges
- Overall churn rate
- Gender distribution
- Senior citizen distribution
- Customer tenure distribution
- Contract type distribution

**Page 2: Customer Churn Analysis**
- Churn rate by contract type
- Churn rate by payment method
- Churn rate by internet service
- Churn rate by tech support
- Churn rate by tenure group
- Churn rate by senior citizen status

**Page 3: Revenue and Retention Opportunities**
- Churned monthly charges
- Average monthly charges of churned customers
- Retained monthly charges
- Revenue at risk percentage
- Churned monthly charges by contract
- Average monthly charges by churn status
- Monthly charges versus customer tenure
- Revenue contribution by internet service

## Key Business Insights

The analysis highlighted the following patterns:

1. Month-to-month contract customers had the highest churn rate at **42.71%**.
2. Electronic-check users had the highest churn rate among payment methods at **45.29%**.
3. Fiber-optic customers had a churn rate of **41.89%**.
4. Customers without tech support had a churn rate of **41.65%**.
5. Customers with 1–12 months of tenure had the highest tenure-group churn rate at **47.68%**.
6. Senior citizens had a churn rate of **41.68%**.
7. Churned customers accounted for **30.53% of total monthly charges** in the analysed dataset.

## Business Recommendations

Based on the analysis, the following actions could be investigated:

- Introduce early-stage engagement and onboarding programmes for new customers.
- Investigate the payment experience for electronic-check users and promote convenient payment alternatives.
- Explore suitable loyalty benefits to encourage month-to-month customers to consider longer-term contracts.
- Investigate customer satisfaction and service issues among fiber-optic users.
- Evaluate whether improved technical support availability could help reduce churn.
- Prioritize retention efforts using both churn risk and the monthly charges associated with customer segments.

## Important Metric Definitions

- **Churn Rate:** Churned customers divided by total customers, multiplied by 100.
- **Revenue at Risk:** Monthly charges associated with churned customers divided by total monthly charges, multiplied by 100.

Revenue at risk represents the share of monthly charges associated with customers who have churned. It is not a measure of confirmed realized revenue loss or a forecast.

## How to Use This Project

1. Clone or download this repository.
2. Install the required Python libraries.
3. Open the notebook in Jupyter Notebook or JupyterLab.
4. Execute the notebook cells to explore the data.
5. Open the SQL script in MySQL Workbench and import the dataset into a table named `customerchurn`.
6. Open the Power BI file using Power BI Desktop.
7. Explore the three dashboard pages and their interactive filters.

## Author
Name : Simran Burnwal

Email : simranburnwal888@gmail.com

Technologies: Python | MySQL | Power BI
