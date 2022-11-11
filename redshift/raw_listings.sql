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

COPY raw_hosts
FROM 's3://nordquant-ie/athena/airbnb/hosts/hosts.csv'
IAM_ROLE 'arn:aws:iam::203090161628:role/RedshiftS3ReadOnlyAccess'
CSV
IGNOREHEADER 1
QUOTE '"'
DELIMITER ','
TIMEFORMAT AS 'YYYY-MM-DD HH24:MI:SS';

SELECT * FROM stl_load_errors;