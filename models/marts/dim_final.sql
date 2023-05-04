{{
  config(
    materialized='table', 
    view_name='dim_final'
  ) 
}}


SELECT 

GENDER, 
AGE,
HYPERTENSION,
HEART_DISEASE,
EVER_MARRIED,
WORK_TYPE,
RESIDENCE_TYPE,
BMI,
SMOKING_STATUS,
STROKE,
STANDARDIZED_AVG_GLUCOSE_LEVEL,

CASE 
    WHEN bmi < 18.5 THEN 'Unhealthy'
    WHEN bmi >= 18.5 AND bmi <= 24.9 THEN 'Healthy'
    WHEN bmi >= 25 AND bmi <= 30 THEN 'Overweight'
    ELSE 'Obese' END AS bmi_category FROM {{ ref('dim_stroke')}}
END