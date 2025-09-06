-- 1. Compare average tenure for churned vs. active customers
SELECT
    CASE WHEN is_churned_flag = 1 THEN 'Churned' ELSE 'Active' END AS customer_status,
    AVG(subscription_tenure_days) AS avg_tenure_days
FROM customer_summary_table
GROUP BY customer_status;

-- 2. Analyze ticket metrics for churned vs. active customers
SELECT
    CASE WHEN is_churned_flag = 1 THEN 'Churned' ELSE 'Active' END AS customer_status,
    AVG(total_support_tickets) AS avg_tickets_per_customer,
    AVG(ticket_resolution_rate) AS avg_resolution_rate
FROM customer_summary_table
GROUP BY customer_status;

-- 3. Total revenue by customer churn status
SELECT
    CASE WHEN is_churned_flag = 1 THEN 'Churned' ELSE 'Active' END AS customer_status,
    SUM(total_spent) AS total_revenue
FROM customer_summary_table
GROUP BY customer_status;
