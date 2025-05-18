SELECT *
FROM {{ source('bookings','tickets') }}