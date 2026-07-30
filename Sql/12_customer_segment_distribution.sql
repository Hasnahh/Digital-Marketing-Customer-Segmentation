-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 12_customer_segment_distribution.sql
--
-- Author: Hasna Kh
--
-- Business Question:
-- How many customers belong to each customer segment?
--
-- Business Importance:
-- Understanding the distribution of customer segments
-- helps businesses prioritize retention, acquisition,
-- and loyalty strategies.
--
-- SQL Concepts Used:
-- • WITH (CTE)
-- • CASE WHEN
-- • GROUP BY
-- • COUNT()
-- • ORDER BY
-- =====================================================

WITH customer_summary AS (

SELECT
    fullVisitorId,
    COUNT(*) AS sessions,
    SUM(IFNULL(totals.transactions,0)) AS total_transactions,
    SUM(IFNULL(totals.transactionRevenue,0))/1000000 AS total_revenue

FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`

GROUP BY
    fullVisitorId

),

customer_segments AS (

SELECT

CASE

WHEN total_revenue >= 10000 THEN 'High Value Customer'
WHEN total_transactions >= 10 THEN 'Loyal Customer'
WHEN total_transactions BETWEEN 1 AND 9 THEN 'Occasional Buyer'
WHEN sessions >= 5 THEN 'Returning Visitor'
ELSE 'One-time Visitor'

END AS customer_segment

FROM customer_summary

)

SELECT

customer_segment,

COUNT(*) AS number_of_customers

FROM customer_segments

GROUP BY customer_segment

ORDER BY number_of_customers DESC;

-- =====================================================
-- Findings
--
-- 1. One-time Visitors represent the largest customer
--    segment, indicating that most visitors leave the
--    website after a single session.
--
-- 2. Returning Visitors demonstrate repeated engagement
--    but have not yet converted into customers,
--    representing a valuable remarketing audience.
--
-- 3. Occasional Buyers have already made purchases and
--    may respond well to personalized promotions and
--    cross-selling campaigns.
--
-- 4. Loyal Customers and High Value Customers represent
--    a very small portion of the customer base but are
--    likely responsible for a disproportionately large
--    share of revenue.
--
-- 5. The distribution suggests that improving customer
--    retention and increasing repeat purchases may have
--    a greater long-term impact than focusing solely on
--    acquiring new visitors.
--
-- Business Recommendations
--
-- • Develop retention campaigns targeting One-time
--   Visitors to encourage repeat engagement.
--
-- • Use remarketing strategies for Returning Visitors
--   who have shown interest but have not purchased.
--
-- • Reward Loyal and High Value Customers with
--   personalized offers, exclusive benefits, and
--   loyalty programs.
--
-- • Monitor movement between customer segments over
--   time to measure the effectiveness of marketing
--   initiatives.
--
-- =====================================================