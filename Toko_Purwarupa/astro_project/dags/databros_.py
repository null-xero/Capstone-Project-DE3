from airflow import DAG
from airflow.operators.bash_operator import BashOperator
# from airflow.providers.dbt.cloud.hooks.dbt import DbtCloudHook
from airflow.providers.docker.operators.docker import DockerOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 8, 6),
    'retries': 1,
}

with DAG('ecommerce_pipeline', default_args=default_args, schedule_interval='@daily') as dag:

    # Task untuk menjalankan Meltano
    run_meltano = DockerOperator(
        task_id='run_meltano',
        image='meltano',
        container_name='meltano_{{ run_id }}',
        command='elt tap-csv target-snowflake',
        dag=dag
    )

    # # Task untuk menjalankan dbt
    # run_dbt = BashOperator(
    #     task_id='run_dbt',
    #     bash_command='cd /project && dbt run',
    #     dag=dag
    # )

    # run_meltano >> run_dbt
