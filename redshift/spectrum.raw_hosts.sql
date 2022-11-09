create external schema spectrum 
from data catalog 
database 'zoli_test' 
IAM_ROLE 'arn:aws:iam::203090161628:role/RedshiftS3ReadOnlyAccess'
create external database if not exists;

DROP TABLE spectrum.raw_hosts;

CREATE EXTERNAL TABLE spectrum.raw_hosts
                    (id INT,
                     name VARCHAR,
                     is_superhost VARCHAR,
                     created_at VARCHAR,
                     updated_at VARCHAR)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE LOCATION 's3://nordquant-ie/athena/airbnb/hosts/'
TABLE PROPERTIES ('skip.header.line.count'='1');

SELECT * FROM spectrum.raw_hosts;