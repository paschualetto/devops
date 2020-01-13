#!/bin/bash

codigo_http=$(curl --write-out %{http_code} --silent --output /dev/null www.google.com)

if [ $codigo_http -ne 200 ]; then

    echo "Tango Down! Verified at $(date +%F\ %T)" >> ./healthcheck.log

fi

echo $codigo_http