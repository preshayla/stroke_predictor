

with source as (
    SELECT *,
  (avg_glucose_level - AVG(avg_glucose_level) OVER ()) / STDDEV(avg_glucose_level) OVER () AS standardized_avg_glucose_level
FROM {{ source('stroke', 'stroke_data') }}
),

staged as (
    select * from source
)

select * from staged
