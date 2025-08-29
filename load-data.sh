#!/bin/bash

set -x

NUM_RESPONDERS=${NUM_RESPONDERS:-3}
NUM_INCIDENTS=${NUM_INCIDENTS:-3}

echo "Loading simulators..."
curl http://localhost:8888/responders/${NUM_RESPONDERS}

echo "Loading incidents..."
curl http://localhost:8888/incidents/${NUM_INCIDENTS}