-- EDA (Exploratory Data Analysis)

-- Understand general data structure, data types
SELECT *
FROM global_supply_chain_risk
LIMIT 10;

-- How big is our dataset? (How many shipments)
SELECT COUNT(*) AS total_shipments
FROM global_supply_chain_risk;

-- Check for missing values
SELECT
    COUNT(*) FILTER (WHERE shipment_id IS NULL) AS shipment_id_missing,
	COUNT(*) FILTER (WHERE shipment_date IS NULL) AS shipment_date_missing,
    COUNT(*) FILTER (WHERE origin_port IS NULL) AS origin_missing,
    COUNT(*) FILTER (WHERE destination_port IS NULL) AS destination_missing,
    COUNT(*) FILTER (WHERE transport_mode IS NULL) AS mode_missing,
    COUNT(*) FILTER (WHERE product_category IS NULL) AS category_missing,
    COUNT(*) FILTER (WHERE distance_km IS NULL) AS distance_missing,
    COUNT(*) FILTER (WHERE weight_mt IS NULL) AS weight_missing,
    COUNT(*) FILTER (WHERE fuel_price_index IS NULL) AS fuel_missing,
    COUNT(*) FILTER (WHERE weather_condition IS NULL) AS weather_missing,
    COUNT(*) FILTER (WHERE geopolitical_risk_score IS NULL) AS geo_missing,
    COUNT(*) FILTER (WHERE carrier_reliability_score IS NULL) AS carrier_missing,
    COUNT(*) FILTER (WHERE lead_time_days IS NULL) AS leadtime_missing,
    COUNT(*) FILTER (WHERE disruption_occurred IS NULL) AS disruption_missing
FROM global_supply_chain_risk;

-- Identify different types of transport_mode
SELECT DISTINCT transport_mode
FROM global_supply_chain_risk;

-- Identify different types of product_category
SELECT DISTINCT product_category
FROM global_supply_chain_risk;

-- Amount of disruptions occured; 0 is no disruption, 1 is disruption 
SELECT Disruption_Occurred, COUNT(*)
FROM global_supply_chain_risk
GROUP BY Disruption_Occurred;

-- Summary Statistics
SELECT
MIN(Distance_km) AS shortest_haul,
MAX(Distance_km) AS longest_haul,
AVG(Distance_km) AS avg_haul,
MIN(Lead_Time_Days) AS min_lead_days,
MAX(Lead_Time_Days) AS max_lead_days,
AVG(Lead_Time_Days) AS avg_lead_days
FROM global_supply_chain_risk;