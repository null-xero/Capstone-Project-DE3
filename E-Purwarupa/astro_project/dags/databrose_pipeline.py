from airflow import DAG
from airflow.providers.docker.operators.docker import DockerOperator
from airflow.utils.dates import days_ago
from airflow.utils.task_group import TaskGroup

default_args = {
    'owner': 'ihsandimas',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
}

with DAG(
    'databros_dags',
    default_args=default_args,
    description='Run Meltano ELT pipeline in Astro',
    schedule_interval=None,
    start_date=days_ago(1),
    catchup=False,
    tags=['elt', 'meltano'],
) as dag:
    
    # Task for Extract
    extract_task = DockerOperator(
    task_id='extract_data',
    image='meltano',
    command='meltano run tap-spreadsheets-anywhere target-snowflake',
    volumes=['/meltano_project:/project'],
    docker_url='unix://var/run/docker.sock',
    network_mode='bridge',
    auto_remove=True,
    working_dir='/project',
)
    
    # Task for Transform
    transform_task = DockerOperator(
        task_id='transform_data',
        image='meltano',
        api_version='auto',
        auto_remove=True,
        command='meltano invoke dbt-snowflake:run',
        docker_url='unix://var/run/docker.sock',
        network_mode='bridge',
        volumes=['/meltano_project:/project'],
        working_dir='/project',
    )

    extract_task >> transform_task
