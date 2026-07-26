-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 01_traffic_sources.sql
--
-- Author: Hasna Kh
--
-- Business Question:
-- Which traffic sources generate the highest number of
-- website sessions?
--
-- Business Importance:
-- Understanding where website traffic originates helps
-- marketers evaluate acquisition channels, identify the
-- most effective sources of visitors, and make informed
-- decisions about marketing budget allocation.
--
-- SQL Concepts Used:
-- • SELECT
-- • COUNT()
-- • GROUP BY
-- • ORDER BY
-- • Column Aliases (AS)
-- • STRUCT Fields (trafficSource.source)
--
-- Dataset:
-- Google Analytics Sample Dataset
-- bigquery-public-data.google_analytics_sample
--
-- Expected Output:
-- A ranked list of the top traffic sources based on the
-- number of website sessions.
-- =====================================================

SELECT
    trafficSource.source AS source,
    COUNT(*) AS sessions
FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY
    source
ORDER BY
    sessions DESC
LIMIT 20;

-- =====================================================
-- Findings
--
-- 1. Direct traffic generated the highest number of
--    website sessions.
--
-- 2. Google Search was the second-largest traffic source,
--    indicating strong organic search performance.
--
-- 3. YouTube contributed a substantial number of
--    website sessions, highlighting the impact of
--    video-driven traffic.
--
-- 4. Several social and referral channels contributed
--    comparatively fewer sessions, suggesting potential
--    opportunities for marketing optimization.
--
-- 5. Traffic volume alone does not measure marketing
--    success. Revenue, conversion rate, and customer
--    quality should also be analyzed before making
--    business decisions.
--
-- =====================================================