
  create view "flightdb"."bookings"."stg_aircrafts_data__dbt_tmp"
    
    
  as (
    SELECT *
FROM "flightdb"."bookings"."aircrafts_data"
  );