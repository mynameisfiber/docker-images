#!/bin/bash

PREPROCESSED_FILENAME='*.MOV'
DATADIR=/data/datasets/social/dance/

for FNAME in $( ls $DATADIR | grep -v ".out.avi" ); do
    echo "==================${FNAME}================";
    if [ ! -e "$DATADIR/${FNAME%.*}.out.avi" ]; then
        nvidia-docker run -it \
            -v $DATADIR:/data \
            openpose:latest \
            /openpose/build/examples/openpose/openpose.bin \
                --video /data/$FNAME \
                --write_video /data/${FNAME%.*}.out.avi \
                --display 0 \
                --net_resolution "960x640" \
                --scale_number 4 \
                --scale_gap 0.25;
    else
        echo "Already Done"
    fi
done
