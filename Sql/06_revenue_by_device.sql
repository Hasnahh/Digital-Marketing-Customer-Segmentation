-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 06_revenue_by_device.sql
--
-- Business Question:
-- Which device category generates the highest revenue?
--
-- Business Importance:
-- Understanding revenue by device helps businesses
-- prioritize website optimization and marketing
-- strategies for the platforms that contribute the
-- most sales.
--
-- SQL Concepts Used:
-- • STRUCT fields (device.deviceCategory)
-- • SUM()
-- • IFNULL()
-- • GROUP BY
-- • ORDER BY
--
-- Expected Insight:
-- Compare revenue generated from desktop, mobile,
-- and tablet users to identify the most valuable
-- device category.
-- =====================================================

SELECT
    device.deviceCategory AS device,
    SUM(IFNULL(totals.transactionRevenue, 0)) / 1000000 AS revenue
FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY
    device
ORDER BY
    revenue DESC;

-- =====================================================
-- Findings
--
-- 1. Desktop users generated the highest revenue.
-- 2. Mobile generated significantly lower revenue than
--    desktop despite accounting for over 20% of sessions.
-- 3. Tablet contributed only a small share of revenue.
-- 4. Device type appears to influence purchasing
--    behavior and should be investigated further.
-- =====================================================