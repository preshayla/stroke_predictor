-- with source as (
--     WITH mean_std_values AS (
--     SELECT AVG(avg_glucose_level) AS mean_value, STDDEV(avg_glucose_level) AS std_dev_value
--     FROM {{ source('stroke', 'stroke_data') }}
-- ),

-- scaled_table AS (
--     SELECT avg_glucose_level,
--     (avg_glucose_level - mean_value) / std_dev_value AS scaled_avg_glucose_level
--     FROM {{ source('stroke', 'stroke_data') }}, mean_std_values
-- )

-- SELECT * FROM scaled_table),

-- staged as (
--     select * from source
-- )

-- select * from staged

with source as (
    SELECT *,
  (avg_glucose_level - AVG(avg_glucose_level) OVER ()) / STDDEV(avg_glucose_level) OVER () AS standardized_avg_glucose_level
FROM {{ source('stroke', 'stroke_data') }}
),

staged as (
    select * from source
)

select * from staged
