FROM python:3.9-slim

WORKDIR /project

RUN pip install meltano

COPY . .

RUN meltano install

ENTRYPOINT ["meltano"]
