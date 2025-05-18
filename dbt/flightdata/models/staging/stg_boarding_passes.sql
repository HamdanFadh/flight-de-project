SELECT *
FROM {{ source('bookings','boarding_passes') }}