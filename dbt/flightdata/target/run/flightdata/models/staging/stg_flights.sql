
  create view "flightdb"."bookings"."stg_flights__dbt_tmp"
    
    
  as (
    SELECT *
FROM "flightdb"."bookings"."flights"
  );