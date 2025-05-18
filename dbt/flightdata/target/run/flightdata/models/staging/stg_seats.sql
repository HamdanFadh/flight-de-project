
  create view "flightdb"."bookings"."stg_seats__dbt_tmp"
    
    
  as (
    SELECT *
FROM "flightdb"."bookings"."seats"
  );