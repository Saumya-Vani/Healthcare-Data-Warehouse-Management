COPY healthcare_data
FROM 's3://healthcare-no-shows/healthcare_noshows.csv'
IAM_ROLE 'arn:aws:iam::{ID}:role/RedshiftS3AccessRole'
FORMAT AS CSV
DELIMITER ','
IGNOREHEADER 1;