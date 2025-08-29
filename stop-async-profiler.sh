#!/bin/bash

ASPROF_DIR=${ASPROF_DIR:-"/tmp/async-profiler"}
ASPROF_OUT_DIR=${ASPROF_OUT_DIR:-"/tmp/async-profiler-output"}

cd /tmp

if [ ! -d "$ASPROF_DIR" ]; then
  echo "Async profiler archive not found, exiting.."
  exit 1
fi

cd ${ASPROF_DIR}

bin/asprof stop  -f ${ASPROF_OUT_DIR}/standalone_${ASPROF_EVENT}.jfr --title "Standalone $(date +"%Y-%m-%dT%H:%M:%SZ)" ${STANDALONE_PID}