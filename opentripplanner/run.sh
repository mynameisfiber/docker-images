#!/bin/bash

docker run \
    -e JAVA_MX=2G \
    -v /data/datasets/transportation/otp/:/data:ro \
    -p 8080:8080 \
    -t opentripplanner:latest \
    --build /data --inMemory
