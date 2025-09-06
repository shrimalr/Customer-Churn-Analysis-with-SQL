-- Create Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    join_date DATE,
    country VARCHAR(50),
    is_churned BOOLEAN
);

-- Create Subscriptions table
CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    plan_type VARCHAR(50),
    start_date DATE,
    end_date DATE
);

-- Create Transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    transaction_date DATE,
    amount DECIMAL(10, 2)
);

-- Create Customer Service Interactions table
CREATE TABLE customer_service_interactions (
    interaction_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    interaction_date DATE,
    issue_category VARCHAR(50),
    is_resolved BOOLEAN
);

-- Populate customers table
INSERT INTO customers (customer_id, join_date, country, is_churned) VALUES
(1, '2022-01-15', 'USA', FALSE),
(2, '2022-02-20', 'USA', TRUE),
(3, '2022-03-10', 'CAN', FALSE),
(4, '2022-04-05', 'USA', TRUE),
(5, '2022-05-12', 'GBR', FALSE),
(6, '2022-06-25', 'AUS', TRUE),
(7, '2022-07-30', 'DEU', FALSE),
(8, '2022-08-18', 'FRA', TRUE),
(9, '2022-09-01', 'USA', FALSE),
(10, '2022-10-10', 'CAN', TRUE),
(11, '2022-11-22', 'GBR', FALSE),
(12, '2022-12-05', 'AUS', TRUE),
(13, '2023-01-08', 'USA', FALSE),
(14, '2023-02-14', 'CAN', TRUE),
(15, '2023-03-19', 'DEU', FALSE),
(16, '2023-04-25', 'USA', FALSE),
(17, '2023-05-30', 'GBR', TRUE),
(18, '2023-06-12', 'AUS', FALSE),
(19, '2023-07-01', 'USA', FALSE),
(20, '2023-08-09', 'FRA', TRUE);

-- Populate subscriptions table
INSERT INTO subscriptions (subscription_id, customer_id, plan_type, start_date, end_date) VALUES
(101, 1, 'Premium', '2022-01-15', '2023-12-31'), -- Active long-term
(102, 2, 'Basic', '2022-02-20', '2022-06-20'), -- Churned
(103, 3, 'Pro', '2022-03-10', '2023-12-31'), -- Active long-term
(104, 4, 'Basic', '2022-04-05', '2022-08-05'), -- Churned
(105, 5, 'Premium', '2022-05-12', '2023-12-31'), -- Active
(106, 6, 'Basic', '2022-06-25', '2022-09-25'), -- Churned
(107, 7, 'Pro', '2022-07-30', '2023-12-31'), -- Active
(108, 8, 'Basic', '2022-08-18', '2022-11-18'), -- Churned
(109, 9, 'Premium', '2022-09-01', '2023-12-31'), -- Active
(110, 10, 'Basic', '2022-10-10', '2023-01-10'), -- Churned
(111, 11, 'Pro', '2022-11-22', '2023-12-31'), -- Active
(112, 12, 'Basic', '2022-12-05', '2023-03-05'), -- Churned
(113, 13, 'Basic', '2023-01-08', '2023-12-31'), -- Active
(114, 14, 'Basic', '2023-02-14', '2023-05-14'), -- Churned
(115, 15, 'Premium', '2023-03-19', '2023-12-31'), -- Active
(116, 16, 'Pro', '2023-04-25', '2023-12-31'), -- Active
(117, 17, 'Basic', '2023-05-30', '2023-08-30'), -- Churned
(118, 18, 'Premium', '2023-06-12', '2023-12-31'), -- Active
(119, 19, 'Basic', '2023-07-01', '2023-12-31'), -- Active
(120, 20, 'Basic', '2023-08-09', '2023-11-09'); -- Churned

-- Populate transactions table
INSERT INTO transactions (transaction_id, customer_id, transaction_date, amount) VALUES
(1001, 1, '2022-01-15', 50.00),
(1002, 1, '2022-02-15', 50.00),
(1003, 2, '2022-02-20', 20.00),
(1004, 2, '2022-03-20', 20.00),
(1005, 3, '2022-03-10', 80.00),
(1006, 3, '2022-04-10', 80.00),
(1007, 4, '2022-04-05', 20.00),
(1008, 5, '2022-05-12', 50.00),
(1009, 5, '2022-06-12', 50.00),
(1010, 6, '2022-06-25', 20.00),
(1011, 7, '2022-07-30', 80.00),
(1012, 8, '2022-08-18', 20.00),
(1013, 9, '2022-09-01', 50.00),
(1014, 10, '2022-10-10', 20.00),
(1015, 11, '2022-11-22', 80.00),
(1016, 12, '2022-12-05', 20.00),
(1017, 13, '2023-01-08', 20.00),
(1018, 14, '2023-02-14', 20.00),
(1019, 15, '2023-03-19', 50.00),
(1020, 16, '2023-04-25', 80.00),
(1021, 17, '2023-05-30', 20.00),
(1022, 18, '2023-06-12', 50.00),
(1023, 19, '2023-07-01', 20.00),
(1024, 20, '2023-08-09', 20.00);

-- Populate customer_service_interactions table
INSERT INTO customer_service_interactions (interaction_id, customer_id, interaction_date, issue_category, is_resolved) VALUES
(2001, 2, '2022-04-10', 'Billing', FALSE), -- Churned, unresolved issue
(2002, 2, '2022-05-01', 'Technical', FALSE), -- Churned, another unresolved issue
(2003, 4, '2022-06-15', 'Technical', FALSE), -- Churned, unresolved
(2004, 6, '2022-08-10', 'General Inquiry', TRUE), -- Churned, but resolved
(2005, 8, '2022-10-01', 'Billing', FALSE), -- Churned, unresolved
(2006, 10, '2023-01-05', 'Technical', TRUE), -- Churned, resolved issue
(2007, 12, '2023-02-28', 'General Inquiry', FALSE), -- Churned, unresolved
(2008, 14, '2023-04-20', 'Technical', FALSE), -- Churned, unresolved
(2009, 17, '2023-07-15', 'Billing', FALSE), -- Churned, unresolved
(2010, 20, '2023-10-01', 'Technical', FALSE), -- Churned, unresolved
(2011, 1, '2022-03-01', 'General Inquiry', TRUE), -- Active, single resolved issue
(2012, 5, '2022-08-20', 'Technical', TRUE), -- Active, single resolved issue
(2013, 9, '2022-11-15', 'Billing', TRUE), -- Active, single resolved issue
(2014, 16, '2023-06-01', 'Technical', TRUE), -- Active, single resolved issue
(2015, 19, '2023-09-01', 'General Inquiry', TRUE); -- Active, single resolved issue
