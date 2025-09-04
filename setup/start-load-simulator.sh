#!/bin/bash

CWD="$(dirname "$0")"

cd ${CWD}/../first-responder-demo

if [ ! -d "simulator/target" ]; then
  echo "Simulator jar not found, building.."
  mvn -B -ntp package -DskipTests -Dquarkus.container-image.build=false -Dquarkus.container-image.push=false -pl simulator -Dquarkus.package.type=uber-jar
  # sanity check
  ls simulator/target
fi

echo "Starting mapbox mock service.."
java -jar -DBACKEND_URL=http://localhost:8080 -DSIM_SEND=true simulator/target/simulator-1.0-SNAPSHOT-runner.jar