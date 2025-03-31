# Healthcare Data Warehouse Management

## Project Overview

This project implements a **cloud-based healthcare data warehouse** to analyze patient appointment behaviors using the **Healthcare Appointment Dataset** from Kaggle. It aims to address the issue of missed medical appointments by providing actionable insights through a scalable AWS-based data pipeline and interactive dashboards.

---

## Objectives

- **Centralized Storage**: Store patient data securely using AWS Redshift.
- **Data Analysis**: Discover patterns in patient attendance (no-shows vs shows).
- **Visualization**: Present data-driven insights using Amazon QuickSight dashboards.
- **Scalability**: Ensure the system can scale with larger datasets and evolving requirements.

---

## Tech Stack

- **AWS S3** – Data staging and storage.
- **AWS Redshift** – Data warehousing and SQL-based analytics.
- **Amazon QuickSight** – BI and interactive dashboards.
- **SQL** – Data transformation, aggregation, and analysis.
- **IAM Roles** – Secure access control for AWS services.

---

## Dataset

- **Source**: [Healthcare Appointment Dataset – Kaggle](https://www.kaggle.com/datasets/wajahat1064/healthcare-appointment-dataset)
- **Key Attributes**:
  - Patient demographics: age, gender, neighborhood
  - Appointment details: scheduling date, attendance status
  - Medical conditions: hypertension, diabetes, alcoholism, handicap
  - Behavioral indicators: SMS reminders, scholarship support

---

## Setup & Execution

### 1. Upload Dataset to S3
Upload `healthcare_noshows.csv` to your S3 bucket.

### 2. Launch Redshift Cluster
- Configure IAM roles with access to S3.
- Set up cluster and security groups as per AWS best practices.

### 3. Create Database Schema
Execute `create_table.sql` to define your schema in Redshift.

### 4. Load Data into Redshift
Use `copy_command.sql` to import data from S3 into Redshift using the `COPY` command.

### 5. Data Analysis
Run SQL scripts (`scriptsForRedshift.sql`) to generate views, summaries, and analytics.

### 6. Visualize with QuickSight
- Connect Redshift to Amazon QuickSight.
- Build visualizations and dashboards such as:
  - Heatmaps for no-shows by age/gender
  - KPI cards (total appointments, shows)
  - Neighborhood-wise attendance charts
  - Time trends for appointment behaviors

---

## Dashboard Features

- **Line Charts**: Appointment trends over time
- **Bar Charts**: Age distributions, attendance by age group
- **Pie Charts**: Appointments by neighborhood
- **Heatmaps**: No-show hotspots, gender/age matrix
- **KPI Cards**: Summary metrics for appointment attendance

See `No-shows_Dashboard.pdf` for sample views.

---

## Features

- Secure cloud-based data storage
- Scalable Redshift cluster for performance
- Actionable, easy-to-interpret dashboards
- Workflow automation potential using AWS services

---

## Worked Example

**Use Case**: Identify neighborhoods with high no-show rates  
**Tool**: Amazon QuickSight – Stacked bar chart  
**Insight**: Neighborhoods like *RESISTÊNCIA*, *SANTA MARTHA* showed higher attendance, guiding targeted improvements in lower-performing areas.

---

## Future Enhancements

- Integrate **machine learning** for no-show prediction
- Automate ETL workflows using **AWS Glue**
- Enable real-time updates using **Amazon Kinesis**

---

## Files Included

| File | Description |
|------|-------------|
| `healthcare_noshows.csv` | The raw dataset |
| `create_table.sql` | SQL schema creation script |
| `copy_command.sql` | SQL script to load data from S3 |
| `scriptsForRedshift.sql` | SQL analysis scripts |
| `scripts.py` | Python script to check Redshift connection |
| `Report.pdf` | Full project report |
| `No-shows_Dashboard.pdf` | Dashboard screenshots and visuals |

---

## References

1. [Healthcare Appointment Dataset – Kaggle](https://www.kaggle.com/datasets/wajahat1064/healthcare-appointment-dataset)  
2. [Amazon Redshift Documentation](https://aws.amazon.com/redshift/)  
3. [Amazon S3 Documentation](https://aws.amazon.com/s3/)  
4. [Amazon QuickSight Documentation](https://aws.amazon.com/quicksight/)
