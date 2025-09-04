#!/bin/bash

set -x

CWD="$(dirname "$0")"
ASPROF_PARAMS=${ASPROF_PARAMS:-"--jfrsync profile -e cpu,lock"}
ASPROF_OUT_FILENAME=${ASPROF_OUT_FILENAME:-"standalone"}

HF_REPORT=${HF_REPORT:-"/tmp/report_${ASPROF_OUT_FILENAME}.html"}

# retrieve the pid
export STANDALONE_PID=$(jps | grep jboss-modules.jar | awk '{ print $1}')

echo "Attaching the profiler"

bash ${CWD}/start-async-profiler.sh

jbang run@hyperfoil -o ${HF_REPORT} ${CWD}/benchmark.hf.yaml

bash ${CWD}/stop-async-profiler.sh