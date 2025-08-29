#!/bin/bash

DB_CONTAINER_NAME=${DB_CONTAINER_NAME:-frdemo-db}

podman run --replace -d --env POSTGRES_PASSWORD=frdemo --env POSTGRES_USER=frdemo --env POSTGRES_DB=frdemo --name ${DB_CONTAINER_NAME} -p 5432:5432 mirror.gcr.io/library/postgres:16