DROP TABLE IF EXISTS raw_listings;
CREATE EXTERNAL TABLE IF NOT EXISTS raw_listings
                    (id INT,
                     listing_url VARCHAR(512),
                     name VARCHAR(512),
                     room_type VARCHAR(512),
                     minimum_nights INT,
                     host_id INT,
                     price VARCHAR(512),
                     created_at VARCHAR(512),
                     updated_at VARCHAR(512))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES ('separatorChar' = ',', 'quoteChar' = '"')
LOCATION 's3://nordquant/athena/airbnb/listings/'
TBLPROPERTIES ("skip.header.line.count"="1")
