#!/bin/bash

PREPROCESSED_FILENAME='*.MOV'
SUFFIX=".out.small.avi"
DATADIR=/data/datasets/social/dance/

for FNAME in $( ls $DATADIR | grep -v $SUFFIX ); do
    echo "==================${FNAME}================";
    if [ ! -e "$DATADIR/${FNAME%.*}${SUFFIX}" ]; then
        nvidia-docker run -it \
            -v $DATADIR:/data \
            openpose:latest \
            /openpose/build/examples/openpose/openpose.bin \
                --video /data/$FNAME \
                --write_video /data/${FNAME%.*}${SUFFIX} \
                --display 0 \
                --net_resolution "320x176" \
                --scale_number 2 \
                --scale_gap 0.25;
    else
        echo "Already Done"
    fi
done
