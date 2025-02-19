# Airflow with Docker Containerization
## Table of contents
1. [Requirements](#requirements)
2. [Prerequisites](#prerequisites)
3. [How to use](#how-to-use)
4. [Project Structure](#project-structure)
5. [Data Analysis](#data-analysis)

### Requirements
* Programming language: Python 3.8.18
* Environment: Linux
* Datalake: Google Cloud Storage
  - Format type: Avro
  - Naming convention: `gs://bucket-name/bikeshare/date=YYYY-MM-DD/hour=HH/data.avro`
* Data scheduler: Apache Airflow 2.7.1
* Database: Postgres 13  
* Container: Docker
* Task schedule: Daily once at 12 AM UTC
* Source data: Google BigQuery public dataset *austin_bikeshare.bikeshare_trips*
* Target external table: `project-id.biglake.bikeshare` with partition *date* (type:STRING) and *hour* (type:STRING). External table recreated daily.

### Prerequisites
1. Create Google account and enable Bigquery sandbox ([link](https://cloud.google.com/bigquery/docs/sandbox#get_started))
2. Install Docker. You can use Docker App ([link](https://docs.docker.com/desktop/)) but since it's used for enterprise purposed, you can use Orbstack for Docker desktop ([link](https://docs.orbstack.dev/quick-start))
3. Create a project in the Google Cloud Platform Console ([link](https://cloud.google.com/cloud-console?hl=en))
 a. Create Google Service Account ([link](https://cloud.google.com/iam/docs/service-accounts-create#creating)) and add below permission:
```
roles/bigquery.dataEditor
roles/bigquery.jobUser
roles/storage.objectAdmin
```
b. Enable Google Bigquery ([link](https://console.cloud.google.com/bigquery))
c. Activate Google Cloud Storage bucket in multi-region US with name: __demo_airflow__ ([link](https://console.cloud.google.com/storage/browser))

### How to use
1. Download the repositories and go to project folder
2. Copy value from your Service Account JSON key to file `scripts/service_account.json`
3. Update file `development.env` and configure your environment variable, especially for GCP connection
4. Turn on Docker and run Docker compose to install the requirements and Airflow
`docker compose --env-file development.env up -d`
5. Open Airflow http://localhost:8080. Find Airflow username and password in the environment variable
6. Turn on DAG **bikeshare_etl** and trigger the task instance
7. Your can see raw data stored in GCS while the external table stored in Bigquery dataset **biglake** table **bikeshare**

### Project Structure
```
├── dags/
│   ├── bikeshare_analysis.sql
│   ├── bikeshare_etl.py
├── scripts/ 
├── ├── service_account.json 
├── .gitignore
├── development.env
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── README.md
```

### Data Analysis
> *I used external table result as source table for data analysis. I also added an Airflow task instance to create a datamart table in Bigquery, but only to answer two questions because I didn't find any key to join result between each question. Hence, I attach my answer in SQL file `dags/bikeshare_analysis.sql`. Thank you!*
