-- Q1: Which transport mode has the most disruptions?
SELECT
transport_mode,
COUNT(*) FILTER (WHERE disruption_occurred = 1) AS disruptions,
COUNT(*) AS total_shipments,
COUNT(*) FILTER (WHERE disruption_occurred = 1) * 1.0 / COUNT(*) AS disruption_rate
FROM global_supply_chain_risk
GROUP BY transport_mode
ORDER BY disruption_rate DESC;

-- Q2: Which product category faces the most disruptions? 
SELECT
product_category,
COUNT(*) FILTER (WHERE disruption_occurred = 1) AS disruptions
FROM global_supply_chain_risk
GROUP BY product_category
ORDER BY disruptions DESC;

-- Q3: Which year had the most disruptions occur? 
SELECT EXTRACT (year FROM shipment_date) AS shipment_year,
COUNT(*) FILTER (WHERE disruption_occurred = 1) AS disruptions
FROM global_supply_chain_risk
GROUP BY EXTRACT(year FROM shipment_date)

-- Q4: Does geopolitcal risk cause disruptions? 
SELECT
AVG(geopolitical_risk_score) FILTER (WHERE disruption_occurred = 1) AS avg_risk_when_disrupted,
AVG(geopolitical_risk_score) FILTER (WHERE disruption_occurred = 0) AS avg_risk_when_normal
FROM global_supply_chain_risk;

-- Q5: Weather impact on disruptions? 
SELECT
    weather_condition,
    COUNT(*) FILTER (WHERE disruption_occurred = 1) AS disruptions,
    COUNT(*) AS shipments,
    ROUND(COUNT(*) FILTER (WHERE disruption_occurred = 1) * 100.0 / COUNT(*), 2) AS disruption_rate_pct
FROM global_supply_chain_risk
GROUP BY weather_condition
ORDER BY disruption_rate_pct DESC;

-- Q6: What were some high-risk corriders (origin_port to destination_port)
SELECT
    origin_port,
    destination_port,
    COUNT(*)                                    AS shipments,
    ROUND(AVG(disruption_occurred) * 100, 1)    AS disruption_rate_pct,
    ROUND(AVG(geopolitical_risk_score), 2)      AS avg_geo_risk
FROM global_supply_chain_risk
GROUP BY origin_port, destination_port
HAVING COUNT(*) >= 10
ORDER BY disruption_rate_pct DESC
LIMIT 15;

-- Q7: Geopolitcal risk tiers: As disruption rate and average lead days increase, does geopolitcal risk also increase?

SELECT
    CASE
        WHEN geopolitical_risk_score >= 7  THEN 'High'
        WHEN geopolitical_risk_score >= 4  THEN 'Medium'
        ELSE 'Low'
    END AS geo_risk_tier,
    COUNT(*)                                    AS shipments,
    ROUND(AVG(disruption_occurred) * 100, 1)    AS disruption_rate_pct,
    ROUND(AVG(lead_time_days), 1)               AS avg_lead_days
FROM global_supply_chain_risk
GROUP BY geo_risk_tier
ORDER BY geo_risk_tier;

-- Q8: What are average metrics for when disruptions occurs and when it's normal?
SELECT
    disruption_occurred,
    ROUND(AVG(distance_km), 2) AS avg_distance_km,
    ROUND(AVG(weight_mt), 2) AS avg_weight_mt,
    ROUND(AVG(fuel_price_index), 2) AS avg_fuel_price_index,
    ROUND(AVG(geopolitical_risk_score), 2) AS avg_geo_risk_score,
    ROUND(AVG(carrier_reliability_score), 2) AS avg_carrier_reliability,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days
FROM global_supply_chain_risk
GROUP BY disruption_occurred;

-- Q9: How does carrier reliability affect disruption rate?
SELECT
    CASE
        WHEN carrier_reliability_score >= 0.80 THEN 'High Reliability'
        WHEN carrier_reliability_score >= 0.60 THEN 'Medium Reliability'
        ELSE 'Low Reliability'
    END AS carrier_score,
    COUNT(*) AS shipments,
    COUNT(*) FILTER (WHERE disruption_occurred = 1) AS disruptions,
    ROUND(100.0 * COUNT(*) FILTER (WHERE disruption_occurred = 1) / COUNT(*), 2) AS disruption_rate_pct,
    ROUND(AVG(lead_time_days), 2) AS avg_lead_time_days
FROM global_supply_chain_risk
GROUP BY
    CASE
        WHEN carrier_reliability_score >= 0.80 THEN 'High Reliability'
        WHEN carrier_reliability_score >= 0.60 THEN 'Medium Reliability'
        ELSE 'Low Reliability'
    END
ORDER BY disruption_rate_pct DESC;

-- Q10: How does fuel price affect disruption rate?
SELECT
    CASE
        WHEN Fuel_Price_Index < 2.0  THEN '< 2.0 (Low)'
        WHEN Fuel_Price_Index < 3.0  THEN '2.0–3.0 (Medium)'
        ELSE '>= 3.0 (High)'
    END AS fuel_band,
    COUNT(*)                                    AS shipments,
    ROUND(AVG(Disruption_Occurred) * 100, 1)    AS disruption_rate_pct,
    ROUND(AVG(Lead_Time_Days), 1)               AS avg_lead_days
FROM global_supply_chain_risk
GROUP BY fuel_band
ORDER BY fuel_band DESC;

-- Q11: Which year had the most disruptions?
SELECT EXTRACT (YEAR FROM shipment_date) AS shipment_year,
    COUNT(*) FILTER (WHERE disruption_occurred = 1) AS disruptions
FROM global_supply_chain_risk
GROUP BY shipment_year
ORDER BY disruptions DESC;
