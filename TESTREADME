TEST ASTRO PROJECT AND MELTANO
===

## 0. Docker
```
docker compose up -d
```

## 1. Check Piton/UloKatok
```
python3 --version
```

## 2. Making Pirtual Enpironmen
```
python3 -m venv .venvtest
source .venvtest/bin/activate
```

## 3. Install AstroBoy
```
curl -sSL install.astronomer.io | sudo bash -s -- v1.28.0
```
- Upgrade to latest version :
```
curl -sSL install.astronomer.io | sudo bash -s
```
- Create Project
```
cd astroboy_project
astro dev init
```

## 4. Install Metanol `THERE ARE TWO OPTIONS`
```
pip install --upgrade pip
pip install "meltano"
```
- Create Metanol Project
```
cd ..
meltano init metanol_project
cd metanol_project
```
- Add Plugin Metanol
1.  Plugin Extractor & Loader `postgres`
```
meltano add extractor tap-postgres
meltano add loader target-postgres
```
2. Edit file `meltano.yml` in directory `my-metanol-project` for config plugin
```
plugins:
  extractors:
  - name: tap-postgres
    config:
      host: localhost
      port: 5432
      user: meltano
      password:
      dbname: mydatabase
  loaders:
  - name: target-postgres
    config:
      host: localhost
      port: 5432
      user: meltano
      password:
      dbname: mydatabase
```

# or

1. Plugin Extractor `csv`, Loader `jsonl`, & Transformer `dbt`
```
meltano add extractor tap-csv
meltano add loader target-jsonl
meltano add transformer dbt
```
2. Edit file `meltano.yml` in directory `my-metanol-project` for config plugin
```
version: 1
plugins:
  extractors:
    - name: tap-csv
      config: {}
  loaders:
    - name: target-jsonl
      config: {}
  transformers:
    - name: dbt
      config: {}
```
* Note: The `{}` sign can be filled in as in the section below

a. Extractors `tap-csv`
```
plugins:
  extractors:
    - name: tap-csv
      config:
        # Location of the CSV file to extract
        path: /path/to/your/data.csv
        # Additional options, for example delimiter
        delimiter: ","
```
b. Loaders `target-jsonl`
```
plugins:
  loaders:
    - name: target-jsonl
      config:
        # Output directory for JSONL files
        output_dir: /path/to/output/directory
        # Whether to overwrite existing files
        overwrite: true
```
c. Transformer `dbt`
```
plugins:
  transformers:
    - name: dbt
      config:
        # Directory containing dbt profiles
        profiles_dir: /path/to/dbt/profiles
        # Dbt project directory
        project_dir: /path/to/dbt/project
```

## 5. Testing Data Pipeline
- Especially those using plugins `csv`, `jsonl`, `dbt`
```
meltano run tap-csv target-jsonl
```

## 6. Run Airplow in local
Go to Airplaw UI and navigate to `DAGs`
```
astro dev start
```
Open url: http://localhost:8080/ for Airplaw UI
- USERNAME: `admin`
- PASSWORD: `admin`

## 7. Create File in FAGs
Go to directory astroboy_project/dags
- Create file `testing_postgres_metanol_astroboy.py` and copy code below
```
from airflow import DAG
from datetime import datetime
from airflow.operators.bash import BashOperator

dag = DAG(
        'postgres-metanol-astroboy',
        description='Hello, The DAGs Testing Metanol AstroBoy For Postgres',
        schedule_interval='0 */5 * * *',
        start_date=datetime(2024, 7, 31),
        catchup=False
)

run_meltano = BashOperator(
    task_id='run_meltano',
    bash_command='cd /metanol_project && meltano run tap-postgres target-postgres',
    dag=dag,
)
```
- Create file `testing_csvjsonldbt_metanol_astroboy.py` and copy code below
```
from airflow import DAG
from datetime import datetime
from airflow.operators.bash import BashOperator

dag = DAG(
        'csvjsonldbt-metanol-astroboy',
        description='Hello, The DAGs Testing Metanol AstroBoy For CSV, JSONL, And DBT',
        schedule_interval='0 */5 * * *',
        start_date=datetime(2024, 7, 31),
        catchup=False
)

run_etl = BashOperator(
    task_id='run_meltano_etl',
    bash_command='cd /metanol_project && meltano run tap-csv target-jsonl',
    dag=dag,
)
```

## 7. ---

## 8. Continue...