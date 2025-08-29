#!/bin/bash

MAPBOX_REPO_NAME=${MAPBOX_REPO_NAME:-"frdemo-mapbox"}

cd /tmp

if [ ! -d "$MAPBOX_REPO_NAME" ]; then
  echo "Mapbox mock repo not found, cloning.."
  git clone https://github.com/hpehl/${MAPBOX_REPO_NAME}.git
  # sanity check
  ls ${MAPBOX_REPO_NAME}
fi

cd /tmp/${MAPBOX_REPO_NAME}

if [ ! -d "target" ]; then
  echo "Mapbox artifacts not found, building.."
  mvn -B -ntp clean package -DskipTests -Dquarkus.package.type=uber-jar
  # sanity check
  ls ./target
fi

echo "Starting mapbox mock service.."
java -jar target/${MAPBOX_REPO_NAME}-1.0.0-SNAPSHOT-runner.jar