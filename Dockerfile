FROM apache/airflow:2.7.1
ADD requirements.txt .
RUN pip install -r requirements.txt
ENV AIRFLOW_UID=50000
