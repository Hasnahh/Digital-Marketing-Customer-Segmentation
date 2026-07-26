-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 07_revenue_by_country.sql
--
-- Business Question:
-- Which countries generate the highest revenue?
--
-- Business Importance:
-- Revenue by country helps identify high-value markets
-- for localization, advertising budgets, and expansion.
--
-- SQL Concepts Used:
-- • STRUCT fields (geoNetwork.country)
-- • SUM()
-- • IFNULL()
-- • GROUP BY
-- • ORDER BY
--
-- Expected Insight:
-- Identify the countries contributing the most revenue
-- and compare them with traffic volume.
-- =====================================================

SELECT
    geoNetwork.country AS country,
    SUM(IFNULL(totals.transactionRevenue, 0)) / 1000000 AS revenue
FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY
    country
ORDER BY
    revenue DESC
LIMIT 15;


-- =====================================================
-- Findings
--
-- 1. The United States generated the highest revenue.
-- 2. Canada ranked second in revenue despite having far
--    fewer sessions than the United States.
-- 3. High-traffic countries did not always rank among the
--    highest revenue-generating markets.
-- 4. Traffic and revenue should be analyzed together when
--    making marketing and expansion decisions.
-- =====================================================