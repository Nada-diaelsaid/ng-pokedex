#!/bin/bata

echo "On branch ${BRANCH}..."
timestamp=$(date +"%Y%m%d%H%M%S")
OUTPUT_DIR=/artifacts/${BRANCH}/${timestamp}

if [ ! -d ${OUTPUT_DIR} ]; then
    mkdir -p ${OUTPUT_DIR}
fi

if [ $1 == "lint" ]; then
    FILE_NAME=${1}.log
    ng lint |& tee ${FILE_NAME}
elif [ $1 == "unit" ]; then
    FILE_NAME=${1}.log
    ng test |& tee ${FILE_NAME}
elif [ $1 == "e2e" ]; then
    FILE_NAME=${1}.log
    ng e2e |& tee ${FILE_NAME}
elif [ $1 == "dist" ]; then
    FILE_NAME=${1}.zip
    zip -r ${FILE_NAME} ${1}
fi

mv ${FILE_NAME} ${OUTPUT_DIR}/${FILE_NAME}