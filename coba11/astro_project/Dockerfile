FROM quay.io/astronomer/astro-runtime:11.7.0
FROM astronomerinc/ap-airflow:latest-onbuild

COPY dags/ /usr/local/airflow/dags/
COPY requirements.txt .

RUN pip install -r requirements.txt
