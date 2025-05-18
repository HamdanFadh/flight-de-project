
  create view "flightdb"."bookings"."stg_ticket_flights__dbt_tmp"
    
    
  as (
    SELECT *
FROM "flightdb"."bookings"."ticket_flights"
  );