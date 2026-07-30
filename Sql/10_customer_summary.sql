-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 10_customer_summary.sql
--
-- Author: Hasna Kh
--
-- Business Question:
-- What is the overall behavior of each customer across
-- all website sessions?
--
-- Business Importance:
-- Businesses make marketing decisions at the customer
-- level, not the individual session level. Creating a
-- customer summary enables segmentation, retention
-- analysis, lifetime value estimation, and predictive
-- modeling.
--
-- SQL Concepts Used:
-- • WITH (CTE)
-- • GROUP BY
-- • COUNT()
-- • SUM()
-- • IFNULL()
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

)

SELECT *

FROM customer_summary

ORDER BY total_revenue DESC

LIMIT 20;
-- =====================================================
-- Findings
--
-- 1. Each row in this analysis represents one unique
--    customer, aggregated across all of their website
--    sessions.
--
-- 2. Customer purchasing behavior varies significantly.
--    Some customers generate high revenue through a
--    single purchase, while others contribute through
--    frequent repeat purchases.
--
-- 3. The highest-value customer generated ₹77,113.43
--    in revenue across 22 transactions and 278 sessions,
--    indicating exceptionally high engagement.
--
-- 4. Customer-level aggregation provides a stronger
--    foundation for segmentation than session-level
--    analysis because each customer is represented only
--    once.
--
-- 5. This summary table will be used as the foundation
--    for advanced segmentation techniques such as
--    RFM Analysis, Customer Lifetime Value (CLV),
--    and Purchase Prediction.
--
-- Business Recommendations
--
-- • Identify and retain high-value customers through
--   loyalty programs and personalized offers.
--
-- • Encourage repeat purchases from occasional buyers
--   using remarketing campaigns and targeted promotions.
--
-- • Use customer-level metrics rather than session-level
--   metrics when making strategic marketing decisions.
--
-- =====================================================