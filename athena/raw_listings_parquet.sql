CREATE TABLE raw_listings_parquet
WITH (external_location ='s3://athena-delta/listings.parquet/')
AS 
SELECT * FROM raw_listings
