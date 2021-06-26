#!/bin/bata

echo "On branch ${BRANCH}..."
OUTPUT_DIR=/artifacts/${BRANCH}

if [ ! -d ${OUTPUT_DIR} ] then
    mkdir ${OUTPUT_DIR}
fi

timestamp=$(date +"%Y%m%d%H%M%S")
FILE_NAME=dist_${timestamp}.zip

zip -r ${FILE_NAME} dist
mv ${FILE_NAME} ${OUTPUT_DIR}/${FILE_NAME}