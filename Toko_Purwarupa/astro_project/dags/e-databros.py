from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.utils.dates import days_ago
import subprocess

# Define the correct paths for Meltano and Astro
MELTANO_PROJECT_DIR = '/meltano_project'
ASTRO_PROJECT_DIR = '/astro_project'

# Define Python callable for Meltano ELT
def run_meltano_elt():
    # Adjust this to match the correct path
    subprocess.run(
        ['meltano', 'elt', 'tap-spreadsheets-anywhere', 'target-snowflake'],
        cwd=MELTANO_PROJECT_DIR,
        check=True
    )

# Define Python callable for dbt transformations
def run_dbt_transform():
    subprocess.run(
        ['dbt', 'run'],
        cwd=ASTRO_PROJECT_DIR,  # Adjust this to match the correct path
        check=True
    )

# Define the DAG
with DAG(
    'e-purwarupa',
    description='A simple ELT pipeline using Meltano and dbt',
    schedule_interval='@daily',  # Adjust schedule as necessary
    start_date=days_ago(1),
    catchup=False,
) as dag:

    start = PythonOperator(
        task_id='start',
        python_callable=lambda: print("Starting DAG"),
    )

    meltano_elt = PythonOperator(
        task_id='meltano_elt',
        python_callable=run_meltano_elt,
    )

    dbt_transform = PythonOperator(
        task_id='dbt_transform',
        python_callable=run_dbt_transform,
    )

    end = PythonOperator(
        task_id='end',
        python_callable=lambda: print("DAG Completed"),
    )

    # Set up the task dependencies
    start >> meltano_elt >> dbt_transform >> end
