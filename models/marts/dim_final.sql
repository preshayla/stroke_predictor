SELECT *, 
CASE WHEN bmi < 18.5 THEN 'Unhealthy' 
WHEN bmi >= 18.5 AND bmi <= 24.9 THEN 'Healthy' 
WHEN bmi >= 25 AND bmi <= 30 THEN 'Overweight' 
ELSE 'Obese' END AS bmi_category FROM {{ ref('dim_stroke')}};

