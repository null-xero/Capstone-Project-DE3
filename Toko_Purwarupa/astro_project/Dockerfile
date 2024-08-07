FROM quay.io/astronomer/astro-runtime:11.7.0


COPY dags/ /usr/local/airflow/dags/
COPY requirements.txt .

RUN pip install -r requirements.txt

# CMD [“astro”, “dev”, “start”]