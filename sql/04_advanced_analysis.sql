-- Use NTILE to analyze churn rate for the top 10% of spenders
WITH RankedCustomers AS (
    SELECT
        customer_id,
        total_spent,
        is_churned_flag,
        NTILE(10) OVER (ORDER BY total_spent DESC) AS spending_decile
    FROM customer_summary_table
)
SELECT
    CASE
        WHEN spending_decile = 1 THEN 'Top 10% Spenders'
        ELSE 'Other Customers'
    END AS customer_group,
    AVG(is_churned_flag) AS churn_rate
FROM RankedCustomers
GROUP BY customer_group;
