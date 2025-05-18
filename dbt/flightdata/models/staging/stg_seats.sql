SELECT *
FROM {{ source('bookings', 'seats') }}