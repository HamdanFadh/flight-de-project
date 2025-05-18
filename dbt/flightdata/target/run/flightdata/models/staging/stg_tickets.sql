
  create view "flightdb"."bookings"."stg_tickets__dbt_tmp"
    
    
  as (
    SELECT *
FROM "flightdb"."bookings"."tickets"
  );