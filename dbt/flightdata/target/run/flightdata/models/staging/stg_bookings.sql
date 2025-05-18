
  create view "flightdb"."bookings"."stg_bookings__dbt_tmp"
    
    
  as (
    SELECT *
FROM "flightdb"."bookings"."bookings"
  );