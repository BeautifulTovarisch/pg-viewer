FROM python:3.8.0 as development
MAINTAINER "Anthony Re"

WORKDIR /app/src/pg-viewer

COPY requirements.txt /app/src/pg-viewer/
RUN pip install --no-cache-dir -r ./requirements.txt

COPY src /app/src/pg-viewer/src

CMD [ "python", "/app/src/pg-viewer/main.py" ]
