DROP TABLE IF EXISTS raw_listings_delta;
CREATE EXTERNAL TABLE raw_listings_delta(id INT,
                     listing_url VARCHAR(512),
                     name VARCHAR(512),
                     room_type VARCHAR(512),
                     minimum_nights INT,
                     host_id INT,
                     price VARCHAR(512),
                     created_at BIGINT,
                     updated_at BIGINT)
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.SymlinkTextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://athena-delta/delta/listings.delta/_symlink_format_manifest'  
