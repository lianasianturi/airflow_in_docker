# Airflow with Docker Containerization


### End-to-end Architecture
* Programming language: Python  [.... version]
* Library dependencies: Google Cloud SDK [.... version]
* Datalake: Google Cloud Storage
  - Format type: Avro
  - Naming convention: `gs://your-bucket-name/bikeshare/YYYY-MM-DD/HH/data.parquet`
* Data scheduler: Airflow
* Container: Docker

### Data Pipeline Configuration
* Source data: Google BigQuery Public Dataset austin_bikeshare.bikeshare_trips
  - Note: Assuming that we extract all historical data because *there's no partition* on the source table
* Task schedule: Daily once at [.... time]
* Target destination table:  [.... table name] -> External table updated / recreated daily

### Prerequisites
1. Create Google account and enable Bigquery sandbox. Reference: https://cloud.google.com/bigquery/docs/sandbox#get_started
2. ....
3. .... [environment setup]

### How to use
1. Install requirement.txt 
2. Download...

### Project Structure
```
├── dags/
│   ├── bikeshare_etl.py 
│   ├── scripts/ 
│   ├── ├──  service_account.json 
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── README.md
```
