-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 02_device_analysis.sql
--
-- Author: Hasna Kh
--
-- Business Question:
-- Which device category generates the highest number of
-- website sessions?
--
-- Business Importance:
-- Understanding how users access the website helps
-- marketers optimize the user experience, prioritize
-- responsive design improvements, and allocate marketing
-- resources across desktop, mobile, and tablet platforms.
--
-- SQL Concepts Used:
-- • SELECT
-- • COUNT()
-- • GROUP BY
-- • ORDER BY
-- • Column Aliases (AS)
-- • STRUCT Fields (device.deviceCategory)
--
-- Dataset:
-- Google Analytics Sample Dataset
-- bigquery-public-data.google_analytics_sample
--
-- Expected Output:
-- A ranked list of device categories based on the number
-- of website sessions.
-- =====================================================

SELECT
    device.deviceCategory AS device,
    COUNT(*) AS sessions
FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY
    device
ORDER BY
    sessions DESC;

-- =====================================================
-- Findings
--
-- 1. Desktop generated the highest number of website
--    sessions (664,479), accounting for approximately
--    73.5% of total traffic.
--
-- 2. Mobile devices generated 208,725 sessions,
--    representing approximately 23.1% of total traffic.
--
-- 3. Tablet users generated 30,449 sessions,
--    contributing approximately 3.4% of total traffic.
--
-- 4. Desktop is the dominant access platform in this
--    dataset, suggesting that most users interact with
--    the website through desktop devices.
--
-- 5. Session volume alone should not determine marketing
--    strategy. Revenue, conversion rate, and customer
--    engagement should also be analyzed before making
--    business decisions.
--
-- =====================================================