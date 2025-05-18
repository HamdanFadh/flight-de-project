SELECT *
FROM {{ source('bookings','ticket_flights') }}