-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 09_customer_segmentation.sql
--
-- Author: Hasna Kh
--
-- Business Question:
-- How many unique visitors made at least one purchase,
-- and how many did not?
--
-- Business Importance:
-- Segmenting visitors into purchasers and
-- non-purchasers helps marketers understand customer
-- behavior and build targeted acquisition and
-- remarketing strategies.
--
-- SQL Concepts Used:
-- • CASE WHEN
-- • COUNT(DISTINCT)
-- • GROUP BY
-- • STRUCT Fields
--
-- Expected Insight:
-- Compare the number of unique purchasing and
-- non-purchasing visitors.
-- =====================================================

SELECT
    CASE
        WHEN totals.transactions IS NOT NULL THEN 'Purchaser'
        ELSE 'Non-Purchaser'
    END AS customer_type,

    COUNT(DISTINCT fullVisitorId) AS unique_visitors

FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`

GROUP BY
    customer_type

ORDER BY
    unique_visitors DESC;

-- =====================================================
-- Findings
--
-- 1. The website had 710,928 unique visitors who did not
--    complete a purchase during the observed period.
--
-- 2. Only 10,022 unique visitors completed at least one
--    transaction.
--
-- 3. The customer base is dominated by non-purchasing
--    visitors, indicating that most users leave the
--    website without making a purchase.
--
-- 4. This suggests significant opportunities to improve
--    conversion through better user experience,
--    remarketing campaigns, personalized offers, and
--    checkout optimization.
--
-- 5. This analysis provides an initial customer
--    segmentation into purchasers and non-purchasers,
--    serving as the foundation for more advanced customer
--    segmentation techniques such as RFM analysis and
--    Customer Lifetime Value (CLV) prediction.
--
-- Business Recommendations
--
-- • Create remarketing campaigns targeting
--   non-purchasing visitors.
--
-- • Analyze why visitors abandon the purchase journey
--   using funnel analysis and landing page analysis.
--
-- • Develop loyalty campaigns for purchasing customers
--   to encourage repeat purchases.
--
-- • Personalize promotions based on customer behavior
--   to improve conversion rates.
--
-- • Use purchaser data as the target variable for future
--   machine learning models predicting purchase
--   probability.
--
-- =====================================================    