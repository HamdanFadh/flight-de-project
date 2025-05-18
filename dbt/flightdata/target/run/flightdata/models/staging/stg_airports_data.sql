
  create view "flightdb"."bookings"."stg_airports_data__dbt_tmp"
    
    
  as (
    SELECT *
FROM "flightdb"."bookings"."airports_data"
  );