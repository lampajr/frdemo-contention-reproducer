#!/bin/bash

KAFKA_VERSION=${KAFKA_VERSION:-"kafka_2.13-3.9.1"}
KAFKA_ARCHIVE_URL=${KAFKA_ARCHIVE_URL:-"https://dlcdn.apache.org/kafka/3.9.1/${KAFKA_VERSION}.tgz"}

cd /tmp

if [ ! -d "$KAFKA_VERSION" ]; then
  echo "Kafka archive not found, downloading.."
  wget ${KAFKA_ARCHIVE_URL}
  tar xf ${KAFKA_VERSION}.tgz
  # sanity check
  ls ${KAFKA_VERSION}
fi

cd /tmp/${KAFKA_VERSION}

bin/kafka-server-start.sh config/server.properties