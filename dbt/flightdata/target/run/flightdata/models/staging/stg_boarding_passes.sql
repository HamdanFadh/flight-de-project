
  create view "flightdb"."bookings"."stg_boarding_passes__dbt_tmp"
    
    
  as (
    SELECT *
FROM "flightdb"."bookings"."boarding_passes"
  );