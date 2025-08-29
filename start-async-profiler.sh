#!/bin/bash

ASPROF_VERSION=${ASPROF_VERSION:-"4.0"}
ASPROF_RELEASE_URL=${ASPROF_RELEASE_URL:-"https://github.com/async-profiler/async-profiler/releases/download/v${ASPROF_VERSION}/async-profiler-${ASPROF_VERSION}-linux-x64.tar.gz"}
ASPROF_DIR=${ASPROF_DIR:-"/tmp/async-profiler"}
ASPROF_OUT_DIR=${ASPROF_OUT_DIR:-"/tmp/async-profiler-output"}

ASPROF_EVENT=${ASPROF_EVENT:-"cpu"}
ASPROF_PARAMS=${ASPROF_PARAMS:-"--jfrsync profile"}

cd /tmp

if [ ! -d "$ASPROF_DIR" ]; then
  echo "Async profiler archive not found, downloading.."
  curl -L ${ASPROF_RELEASE_URL} > /tmp/async-profiler.tgz
  tar -xvf /tmp/async-profiler.tgz -C /tmp
  mv /tmp/async-profiler-${ASPROF_VERSION}-linux-x64 ${ASPROF_DIR}
  # sanity check
  ls ${ASPROF_DIR}
fi

if [ -d ${ASPROF_OUT_DIR} ]; then 
  rm -rf ${ASPROF_OUT_DIR};
  mkdir -p ${ASPROF_OUT_DIR} && chmod 777 ${ASPROF_OUT_DIR} || echo "Cannot create ${ASPROF_OUT_DIR} directory"
fi

cd ${ASPROF_DIR}

bin/asprof start -e ${ASPROF_EVENT} -f ${ASPROF_OUT_DIR}/standalone_${ASPROF_EVENT}.jfr ${ASPROF_PARAMS} ${STANDALONE_PID}