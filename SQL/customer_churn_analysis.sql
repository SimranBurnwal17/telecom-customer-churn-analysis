create database test2;
use test2;
select * from customerchurn;

-- Total no of customers
select count(distinct customerID) as total_customers from customerchurn;

-- Percentage of customers churned
WITH cte AS (
    SELECT
        COUNT(customerID) AS churned_customers
    FROM customerchurn
    WHERE Churn = 'Yes'
)
SELECT
    churned_customers,
    (churned_customers * 100.0 /
        (SELECT COUNT(customerID)
         FROM customerchurn)
    ) AS churn_percentage
FROM cte;

-- Senior Citizen
select count(customerID) as total_customer from customerchurn
where SeniorCitizen=1;

-- Distribution of customers by partner and gender
Select partner,gender,count(customerID) as total_customers from customerchurn
group by partner,gender;

-- Churn Rate by contract type
select contract, count(customerID) as total_customers,
sum(case when Churn='Yes' then 1 else 0 end) as churned_customers,
round(100.0*sum(case when Churn='Yes' then 1 else 0 end)/count(*),2) as churn_rate
from customerchurn
group by contract;

-- Churn Rate by payment method
SELECT paymentmethod, COUNT(*) AS total_customers,
    ROUND(100.0 * sum(case when Churn='Yes' then 1 else 0 end)/ COUNT(*), 2) AS churn_rate
FROM customerchurn
GROUP BY paymentmethod
ORDER BY churn_rate DESC;

-- Churn Rate by TechSupport
select TechSupport, COUNT(*) AS total_customers,
    ROUND(100.0 * sum(case when Churn='Yes' then 1 else 0 end)/ COUNT(*), 2) AS churn_rate
FROM customerchurn
GROUP BY TechSupport
ORDER BY churn_rate DESC;

-- Average monthly Charge of churned customers
select avg(MonthlyCharges) from customerchurn
where Churn='Yes';

-- Monthly Revenue from churned customers
select sum(MonthlyCharges) as lost_monthly_revenue from customerchurn
where Churn = 'Yes';

-- Total Revenue across contract types
SELECT Contract,
    SUM(MonthlyCharges) AS total_monthly_revenue,
    COUNT(CustomerID) AS total_customers
FROM customerchurn
GROUP BY Contract
ORDER BY total_monthly_revenue DESC;

-- Customer Segement that generates the highest avg revenue
SELECT Contract, ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_revenue FROM customerchurn
GROUP BY Contract
ORDER BY avg_monthly_revenue DESC;

SELECT Gender, ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_revenue FROM customerchurn
GROUP BY Gender
ORDER BY avg_monthly_revenue DESC;

SELECT InternetService, ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_revenue FROM customerchurn
GROUP BY InternetService
ORDER BY avg_monthly_revenue DESC;

SELECT SeniorCitizen, ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_revenue FROM customerchurn
GROUP BY SeniorCitizen
ORDER BY avg_monthly_revenue DESC;

SELECT PaymentMethod, ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_revenue FROM customerchurn
GROUP BY PaymentMethod
ORDER BY avg_monthly_revenue DESC;

-- Ranking payment methods based on churn rate
WITH payment_churn AS (
    SELECT PaymentMethod, COUNT(CustomerID) AS total_customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
        ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)* 100.0 / COUNT(CustomerID), 2) AS churn_rate
    FROM customerchurn
    GROUP BY PaymentMethod
)
SELECT PaymentMethod, total_customers, churned_customers, churn_rate,
    DENSE_RANK() OVER (ORDER BY churn_rate DESC) AS churn_rank
FROM payment_churn
ORDER BY churn_rank;

-- Compare monthly charges of churned and retained customers
SELECT
    CASE
        WHEN Churn = 'Yes' THEN 'Churned'
        ELSE 'Retained'
    END AS customer_status,

    COUNT(CustomerID) AS total_customers,

    ROUND(AVG(MonthlyCharges), 2)
        AS average_monthly_charges,

    MIN(MonthlyCharges)
        AS minimum_monthly_charges,

    MAX(MonthlyCharges)
        AS maximum_monthly_charges,

    ROUND(SUM(MonthlyCharges), 2)
        AS total_monthly_charges

FROM customerchurn
GROUP BY Churn
ORDER BY Churn DESC;
