-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 05_conversion_rate.sql
--
-- Business Question:
-- What percentage of website sessions resulted
-- in at least one purchase?
--
-- Business Importance:
-- Conversion Rate measures how effectively a
-- website turns visitors into customers.
-- It is one of the most important marketing KPIs.
--
-- SQL Concepts Used:
-- • COUNT()
-- • SUM()
-- • IF()
-- • SAFE_DIVIDE()
-- • ROUND()
--
-- Formula:
-- Conversion Rate =
-- (Purchasing Sessions / Total Sessions) × 100
-- =====================================================

SELECT
    COUNT(*) AS total_sessions,

    SUM(
        IF(totals.transactions IS NOT NULL,1,0)
    ) AS purchasing_sessions,

    ROUND(
        SAFE_DIVIDE(
            SUM(IF(totals.transactions IS NOT NULL,1,0)),
            COUNT(*)
        ) * 100,
        2
    ) AS conversion_rate_percent

FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`;

-- =====================================================
-- Findings
--
-- 1. Total website sessions: 903,653
-- 2. Purchasing sessions: 11,552
-- 3. Overall conversion rate: 1.28%
-- 4. This KPI serves as a baseline for evaluating the
--    effectiveness of future marketing campaigns and
--    website optimization initiatives.
-- =====================================================    