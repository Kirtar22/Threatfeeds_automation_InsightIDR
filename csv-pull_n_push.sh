#!/bin/bash


for i in $(cat <directory_path_to the_file_that_hodls_the_feed_urls>/threat_feeds)
do
wget -P /home/temp $i 
done

## 
for i in  /home/temp/*
do
echo $i
q=$(echo $i | cut -d '/' -f6)
#echo $q
grep -v "#" $i >cleanfiles/$q
rm -rf $i
sed 's/$/,/g' cleanfiles/$q >upload/$q
curl -d "@upload/$q" -H "X-Api-Key: <idr_api_key> " -H "Content-Type: text/csv" \
-X POST https://au.api.insight.rapid7.com/idr/v1/customthreats/key/<threat_key>/indicators/add?format=csv
done