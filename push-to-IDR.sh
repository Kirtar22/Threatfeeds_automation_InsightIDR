#!/bin/sh

for filename in <path_to_dir_where_STIXXfiles_stored>/user_*; do 
echo "$filename" 
#use your region for connecting to IDR API in the command

curl -d "@$filename" -H "X-Api-Key: <idr_api_key> " -H "Content-Type: text/xml" \
-X POST https://au.api.insight.rapid7.com/idr/v1/customthreats/key/<threat_key>/indicators/add?format=stix_xml
done

