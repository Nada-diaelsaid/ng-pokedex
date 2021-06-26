#!/bin/bash

set -o pipefail

echo "On branch ${BRANCH}..."
timestamp=$(date +"%Y%m%d%H%M%S")
OUTPUT_DIR=/artifacts/${BRANCH}/${timestamp}
exit_status=0

if [ ! -d ${OUTPUT_DIR} ]; then
    mkdir -p ${OUTPUT_DIR}
fi

if [ $1 == "lint" ]; then
    FILE_NAME=${1}.log
    ng lint |& tee ${FILE_NAME}
    exit_status=${PIPESTATUS[0]}
elif [ $1 == "unit" ]; then
    FILE_NAME=${1}.log
    ng test |& tee ${FILE_NAME}
    exit_status=${PIPESTATUS[0]}
elif [ $1 == "e2e" ]; then
    FILE_NAME=${1}.log
    ng e2e |& tee ${FILE_NAME}
    exit_status=${PIPESTATUS[0]}
elif [ $1 == "dist" ]; then
    FILE_NAME=${1}.zip
    zip -r ${FILE_NAME} ${1}
    exit_status=${PIPESTATUS[0]}
fi

mv ${FILE_NAME} ${OUTPUT_DIR}/${FILE_NAME}
exit ${exit_status}