with ages as (select * from {{ref ('stg_age_cleansing')}}),
glucose as (select id,standardized_avg_glucose_level from {{ref ('stg_standardisation')}}),
final as (select * from ages left join glucose on id)
select * from final