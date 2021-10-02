FROM python:3.8-alpine

WORKDIR /app
ADD ./backend/requirements.txt /app/backend/

RUN apk update && \
    apk add postgresql-dev gcc g++ jpeg-dev zlib-dev python3-dev musl-dev
RUN pip install --upgrade pip
RUN pip install gunicorn && \
    pip install -r backend/requirements.txt


ADD ./docker /app/docker
ADD ./backend /app/backend

RUN ls /app/backend