-- This script aggregates data and creates a comprehensive customer summary table for analysis.

WITH ChurnStatus AS (
    SELECT
        customer_id,
        MAX(CASE WHEN is_churned = TRUE THEN 1 ELSE 0 END) AS is_churned_flag
    FROM customers
    GROUP BY customer_id
),
SubscriptionDetails AS (
    SELECT
        customer_id,
        DATEDIFF(day, MIN(start_date), MAX(end_date)) AS subscription_tenure_days,
        COUNT(subscription_id) AS total_subscriptions
    FROM subscriptions
    GROUP BY customer_id
),
TransactionSummary AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spent,
        COUNT(transaction_id) AS total_transactions,
        AVG(amount) AS average_transaction_amount
    FROM transactions
    GROUP BY customer_id
),
ServiceInteractions AS (
    SELECT
        customer_id,
        COUNT(interaction_id) AS total_support_tickets,
        SUM(CASE WHEN is_resolved = TRUE THEN 1 ELSE 0 END) AS resolved_tickets
    FROM customer_service_interactions
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.join_date,
    cs.is_churned_flag,
    sd.subscription_tenure_days,
    COALESCE(ts.total_spent, 0) AS total_spent,
    COALESCE(ts.total_transactions, 0) AS total_transactions,
    COALESCE(si.total_support_tickets, 0) AS total_support_tickets,
    CASE
        WHEN si.total_support_tickets > 0 THEN CAST(si.resolved_tickets AS FLOAT) / si.total_support_tickets
        ELSE 0
    END AS ticket_resolution_rate
INTO customer_summary_table -- Use INTO to create a new table from the query
FROM customers c
LEFT JOIN ChurnStatus cs ON c.customer_id = cs.customer_id
LEFT JOIN SubscriptionDetails sd ON c.customer_id = sd.customer_id
LEFT JOIN TransactionSummary ts ON c.customer_id = ts.customer_id
LEFT JOIN ServiceInteractions si ON c.customer_id = si.customer_id;
