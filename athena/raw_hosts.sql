DROP TABLE IF EXISTS raw_hosts;
CREATE EXTERNAL TABLE IF NOT EXISTS raw_hosts
                    (id INT,
                     name VARCHAR(512),
                     is_superhost VARCHAR(512),
                     created_at VARCHAR(512),
                     updated_at VARCHAR(512))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES ('separatorChar' = ',', 'quoteChar' = '"')
LOCATION 's3://nordquant/athena/airbnb/hosts/'
TBLPROPERTIES ("skip.header.line.count"="1")
