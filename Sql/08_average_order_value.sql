-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 08_average_order_value.sql
--
-- Business Question:
-- What is the Average Order Value (AOV)?
--
-- Business Importance:
-- AOV measures the average revenue generated per completed
-- transaction. Increasing AOV is a common business goal
-- because it boosts revenue without necessarily increasing
-- the number of customers.
--
-- SQL Concepts Used:
-- • SUM()
-- • IFNULL()
-- • SAFE_DIVIDE()
-- • ROUND()
--
-- Formula:
-- AOV = Total Revenue ÷ Total Transactions
-- =====================================================

SELECT
    ROUND(
        SUM(IFNULL(totals.transactionRevenue, 0)) / 1000000,
        2
    ) AS total_revenue,

    SUM(IFNULL(totals.transactions, 0)) AS total_transactions,

    ROUND(
        SAFE_DIVIDE(
            SUM(IFNULL(totals.transactionRevenue, 0)) / 1000000,
            SUM(IFNULL(totals.transactions, 0))
        ),
        2
    ) AS average_order_value

FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`;

-- =====================================================
-- Findings
--
-- 1. Total Revenue: 1,540,071.24
-- 2. Total Transactions: 12,115
-- 3. Average Order Value (AOV): 127.12
-- 4. AOV serves as a baseline metric for evaluating
--    pricing strategies, promotional offers, and
--    cross-selling initiatives.
-- =====================================================    