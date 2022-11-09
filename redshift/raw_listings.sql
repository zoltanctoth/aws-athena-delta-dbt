CREATE TABLE IF NOT EXISTS raw_listings
                    (id INT,
                     listing_url VARCHAR(512),
                     name VARCHAR(512),
                     room_type VARCHAR(512),
                     minimum_nights INT,
                     host_id INT DISTKEY SORTKEY,
                     price VARCHAR(512),
                     created_at TIMESTAMP,
                     updated_at TIMESTAMP);

COPY raw_listings
FROM 's3://nordquant-ie/athena/airbnb/listings/listings.csv'
IAM_ROLE 'arn:aws:iam::203090161628:role/RedshiftS3ReadOnlyAccess'
CSV
IGNOREHEADER 1
QUOTE '"'
DELIMITER ','
TIMEFORMAT AS 'YYYY-MM-DDTHH24:MI:SSZ';

SELECT * FROM stl_load_errors;