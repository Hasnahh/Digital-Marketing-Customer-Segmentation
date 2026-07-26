-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 03_country_analysis.sql
--
-- Author: Hasna Kh
--
-- Business Question:
-- Which countries generate the highest number of website
-- sessions?
--
-- Business Importance:
-- Understanding visitor distribution by country helps
-- marketers identify high-potential markets, prioritize
-- localization efforts, optimize advertising budgets,
-- and develop region-specific marketing strategies.
--
-- SQL Concepts Used:
-- • SELECT
-- • COUNT()
-- • GROUP BY
-- • ORDER BY
-- • LIMIT
-- • Column Aliases (AS)
-- • STRUCT Fields (geoNetwork.country)
--
-- Key Skills Demonstrated:
-- • Geographic Traffic Analysis
-- • Marketing Analytics
-- • Data Aggregation
-- • Working with Nested Data (STRUCT)
-- • Business Insight Generation
--
-- Dataset:
-- Google Analytics Sample Dataset
-- bigquery-public-data.google_analytics_sample
--
-- Expected Output:
-- A ranked list of the top countries generating website
-- sessions.
-- =====================================================

SELECT
    geoNetwork.country AS country,
    COUNT(*) AS sessions
FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY
    country
ORDER BY
    sessions DESC
LIMIT 20;

-- =====================================================
-- Findings
--
-- 1. The United States generated the highest number of
--    website sessions (364,744), making it the largest
--    source of website traffic.
--
-- 2. India ranked second with 51,140 sessions, followed
--    by the United Kingdom and Canada.
--
-- 3. The dataset shows strong international reach, with
--    visitors arriving from multiple countries across
--    different regions.
--
-- 4. High traffic from a country does not necessarily
--    indicate high revenue or high conversion rates.
--    Additional KPI analysis is required before making
--    strategic marketing decisions.
--
-- 5. Geographic analysis provides valuable insights for
--    localization, regional advertising campaigns, and
--    market expansion opportunities.
--
-- Business Recommendation:
--
-- • Prioritize detailed analysis of high-traffic markets
--   by comparing sessions with revenue and conversion
--   rates.
--
-- • Consider localized marketing campaigns for countries
--   with strong traffic but investigate whether they also
--   deliver strong business value before increasing
--   advertising investment.
--
-- =====================================================