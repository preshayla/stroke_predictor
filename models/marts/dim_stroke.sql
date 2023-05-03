

CREATE OR REPLACE VIEW DIM_STROKE AS
SELECT a.ID AS AGE_ID, g.ID as glucose_id,

a.gender,
a.age,
a.hypertension,
a.heart_disease,
a.ever_married,
a.work_type,
a.Residence_type,
a.avg_glucose_level,
a.bmi,
a.smoking_status,
a.stroke,
g.STANDARDIZED_AVG_GLUCOSE_LEVEL

FROM {{ref ('stg_age_cleansing')}} as a
LEFT JOIN (SELECT ID, STANDARDIZED_AVG_GLUCOSE_LEVEL from  {{ref ('stg_standardisation')}}) as g
ON a.id = g.id;
