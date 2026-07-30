-- =====================================================
-- Project: Digital Marketing Customer Segmentation
-- File: 11_customer_segments.sql
--
-- Author: Hasna Kh
--
-- Business Question:
-- How can customers be segmented based on their
-- engagement and purchasing behavior?
--
-- Business Importance:
-- Customer segmentation enables personalized marketing,
-- better budget allocation, improved customer retention,
-- and targeted promotional campaigns.
--
-- SQL Concepts Used:
-- • WITH (CTE)
-- • CASE WHEN
-- • SUM()
-- • COUNT()
-- • GROUP BY
-- • ORDER BY
--
-- Key Skills Demonstrated:
-- • Customer Segmentation
-- • Marketing Analytics
-- • Business Classification
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

SELECT

    fullVisitorId,

    sessions,

    total_transactions,

    ROUND(total_revenue,2) AS total_revenue,

CASE

WHEN total_revenue >= 10000
THEN 'High Value Customer'

WHEN total_transactions >= 10
THEN 'Loyal Customer'

WHEN total_transactions BETWEEN 1 AND 9
THEN 'Occasional Buyer'

WHEN sessions >= 5
THEN 'Returning Visitor'

ELSE 'One-time Visitor'

END AS customer_segment

FROM customer_summary

ORDER BY total_revenue DESC

LIMIT 50;

-- =====================================================
-- Findings
--
-- 1. Customers were successfully classified into
--    business-friendly segments using engagement and
--    purchasing behavior.
--
-- 2. High Value Customers generated the highest revenue,
--    making them ideal candidates for VIP treatment and
--    personalized retention campaigns.
--
-- 3. Loyal Customers completed many transactions,
--    indicating strong repeat purchasing behavior even
--    when their total revenue was lower than some
--    high-value customers.
--
-- 4. Occasional Buyers have already demonstrated purchase
--    intent and may respond well to cross-selling,
--    upselling, and personalized promotions.
--
-- 5. Returning Visitors represent an opportunity to
--    improve conversion through remarketing campaigns,
--    while One-time Visitors require engagement
--    strategies to encourage repeat visits.
--
-- Business Recommendations
--
-- • Offer exclusive rewards to High Value Customers.
--
-- • Build loyalty programs for frequent purchasers.
--
-- • Retarget Returning Visitors with first-purchase
--   incentives.
--
-- • Personalize email and advertising campaigns based on
--   customer segment rather than treating all visitors
--   equally.
--
-- =====================================================