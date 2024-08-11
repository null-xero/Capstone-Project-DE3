# Project Overview

E-Purwarupa is a company that sells various kinds of products. In its business process, E-Purwarupa uses a website as the main buying and selling instrument. The website contains multiple types of buying and selling data such as user activity, product transactions, and user behavior.
E-Purwarupa seeks to develop analysis based on data-driven decisions for inventory and promotion.

# Project Scope

Challenges: Extract, transform, and load data from multiple sources to analyze product performance.
Key Metrics: Total sales, average sales per period, sales growth, and return rates.

## Table of Contents

- [Dataset](#dataset)
- [Installation](#installation)
- [Getting Started](#getting-started)
- [Pipeline Upgrade](#pipeline-upgrade)
- [Meltano Setup](#meltano-setup)
- [Environment Configuration](#environment-configuration)
- [Extract, Load, and Transform](#extract-load-and-transform)
- [Running the Project](#running-the-project)
- [Environment Variables](#environment-variables)
- [Resources](#resources)

## Dataset

- Orders.csv | [Download file](https://drive.usercontent.google.com/download?id=1jvrGq2XSvJSraxTv0hFoCTJ5FGKNv6AH&export=download&authuser=0&confirm=t&uuid=ac62e281-2096-4a1d-ad68-2c62095f8d86&at=APZUnTVxcC2oizHRnBMYgGQ0Q7K4:1723376085808)
- Order_items.csv | [Download file](https://drive.usercontent.google.com/download?id=1S12qShi_1scqyTmvfMGhzW8bvDU-M_NR&export=download&authuser=0&confirm=t&uuid=bc265abe-4649-406c-8232-5c477fcb0af6&at=APZUnTVAVdAt2jPneNIJP3cyTVsn:1723375639127)
- Order_payments.csv | [Download file](https://drive.usercontent.google.com/download?id=1NScINOTa5-OfRX9EYm6K8whYUxN38jEs&export=download&authuser=0&confirm=t&uuid=5a9232a4-db5d-4778-a10e-2ded7e5b61f5&at=APZUnTXKZSEH6lW_l_OGReZNU3pQ:1723376387522)
- Order_reviews.csv | [Download file](https://drive.usercontent.google.com/download?id=11ogKsU3vz5DuQ7WXE4KvNh7Q_g05LGaN&export=download&authuser=0&confirm=t&uuid=af5ba6fd-9152-4c7e-ab51-910ed78b5db4&at=APZUnTV3R2RxsouxHwgCOyZagfRp:1723376404965)
- Products.csv | [Download file](https://drive.usercontent.google.com/download?id=1UDUSPUYZ_Aj8gEEPEFNzKj_Q4ovq_-e4&export=download&authuser=0&confirm=t&uuid=fd39201a-19bc-4114-8c10-f1b01e4d4448&at=APZUnTX6xKVz3-xAzmpH0H3iDa6f:1723376345392)
- Sellers.csv | [Download file](https://drive.usercontent.google.com/download?id=1ggsGSE2bU_bt-0qR3EiUVPfWwTZXq-s5&export=download&authuser=0&confirm=t&uuid=073b98d6-c64b-428e-b1cb-15267f26ebaa&at=APZUnTVVVIEfc9ImP23w3ZpuAipx:1723376367708)
- Costumers.csv | [Download file](https://drive.usercontent.google.com/download?id=1l1aeM5wXErCwwjvuxFlg50CMaVvA6G2v&export=download&authuser=0&confirm=t&uuid=d14efb1d-44c1-4d62-bfe7-4c16d0b8161a&at=APZUnTWr8U4iyXnpH8Fq9sMF-n3-:1723375415963)
- Returned_products.json | [Download file](https://drive.usercontent.google.com/download?id=1Zl4Qv7TUo8Ffd4NwvVLQV5bN6E044tGj&export=download&authuser=0&confirm=t&uuid=3600c414-1fa0-4f49-a213-dce0e8450d63&at=APZUnTXju0aM-f5OAtDnHK1wTd25:1723376442261)

You can Download Dataset or check this Repository in `path: E-Purwarupa/meltano_porject/data/`

## Data Pipeline Design

![ELT_Data_Architecture](https://github.com/null-Xero/Capstone-Project-DE3/blob/MasterNull/E-Purwarupa/.assets/ELT_Data_Architecture.png)

## Entity Relationship Diagram

![ERD](https://github.com/null-Xero/Capstone-Project-DE3/blob/MasterNull/E-Purwarupa/.assets/Entity_Relationship_Diagram.png)

## Installation

### Astro Installation

To install Astro locally, run the following command:

```bash
curl -sSL install.astronomer.io | sudo bash -s
```

### Meltano Installation

To install Meltano, you can use one of the following commands:

```bash
pip install "meltano"
```
or
```bash
pip install --upgrade "meltano"
```

## Getting Started

### Initialize Astro

Initialize your Astro project with the following command:

```bash
astro dev init
```

Start Astro by running:

```bash
astro dev start
```

## Pipeline Upgrade

Ensure your pipeline tools are up-to-date by upgrading `pip`:

```bash
pip install --upgrade pip
```

## Meltano Setup

### Create a Meltano Environment

Refer to the Meltano documentation to create and manage environments:

[Environment Documentation](https://docs.meltano.com/concepts/environments/?meltano-tabs=env)

## Extract, Load, and Transform

### Install Extractor for Raw Data

Install the necessary extractor for your raw data. For example, using the tap-spreadsheets-anywhere extractor:

[Extractor Documentation](https://hub.meltano.com/extractors/tap-spreadsheets-anywhere)

### Install Loader for Snowflake

Set up the loader for Snowflake to transfer data:

[Loader Documentation](https://hub.meltano.com/loaders/target-snowflake)

### Install Transformer for DBT

Set up the DBT transformer for your data transformations:

[Transformer Documentation for DBT Snowflake](https://hub.meltano.com/utilities/dbt-snowflake)

[Transformer Guide](https://docs.meltano.com/guide/transformation)

### Install Meltano Plugins

Install all the required Meltano plugins:

```bash
meltano install
```

## Environment Configuration

### Environment Variables for Snowflake

Create a `.env` file in the root of your project to securely store your Snowflake credentials and other sensitive information. This helps to maintain privacy and security.

Here's an example `.env` configuration for Snowflake:

```bash
MELTANO_ENVIRONMENT='environment_meltano'

TARGET_SNOWFLAKE_ACCOUNT='Account Snowflake'
TARGET_SNOWFLAKE_USER='User Snowflake'
TARGET_SNOWFLAKE_PASSWORD='Password Snowflake'

DBT_SNOWFLAKE_ACCOUNT='Account Snowflake'
DBT_SNOWFLAKE_USER='User Snowflake'
DBT_SNOWFLAKE_PASSWORD='Password Snowflake'
DBT_SNOWFLAKE_ROLE='MELTANO_ROLE'
DBT_SNOWFLAKE_WAREHOUSE='MELTANO_WAREHOUSE'
DBT_SNOWFLAKE_DATABASE='MELTANO_DATABASE'
DBT_SNOWFLAKE_SCHEMA='MELTANO_DBT_SCHEMA'
```

## Running the Project

After setting up your environment and installing the necessary plugins, you can start running your data pipeline and analytics processes.

To run the pipeline using DBT, execute the following command:

```bash
meltano --environment=dev run tap-spreadsheets-anywhere target-snowflake dbt-snowflake:run
```

## Resources

- [Astro Documentation](https://docs.astronomer.io/)
- [Meltano Documentation](https://docs.meltano.com/)
- [Snowflake Documentation](https://docs.snowflake.com/)

Feel free to explore and modify this template to fit your project's needs. Happy coding!
```

This updated `README.md` now includes the necessary steps and configuration details to set up and run DBT with Meltano. Let me know if you need any more changes!