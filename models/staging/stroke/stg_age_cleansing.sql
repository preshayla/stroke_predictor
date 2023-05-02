with source as (
    select * from {{ source('stroke', 'stroke_data') }}
    where age >= 2
),

staged as (
    select * from source
)

select * from staged
