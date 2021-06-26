#!/bin/bata

timestamp=$(date +"%Y%m%d%H%M%S")

zip -r dist_${timestamp}.zip dist
mv dist_${timestamp}.zip /artifacts/dist_${timestamp}.zip