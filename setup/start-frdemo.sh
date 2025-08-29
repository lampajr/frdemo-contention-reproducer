#!/bin/bash

CWD="$(dirname "$0")"

cd ${CWD}/../first-responder-demo

mvn clean package -pl backend

echo "Deploying First Responder Demo App.."

source ./backend/local.env
./backend/target/server/bin/standalone.sh