#!/bin/bash

response=$(curl --write-out %{http_code} --silent --output /dev/null -k "$HEALTHCHECK_URL")

if [[ "$response" == "502" ]]; then 
    nginx -s reload
fi

