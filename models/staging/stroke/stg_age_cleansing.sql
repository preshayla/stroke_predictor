select * from {{ source('stroke_data', 'stroke_data')}}
where age >= 2