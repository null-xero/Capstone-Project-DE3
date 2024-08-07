FROM python:3.9-slim

WORKDIR /project

RUN pip install dbt

COPY . .

ENTRYPOINT ["dbt"]
