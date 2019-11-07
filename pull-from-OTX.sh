#!/bin/bash

date1=$(date -Iseconds)
echo $date1

taxii-poll --path https://otx.alienvault.com/taxii/poll --collection user_AlienVault \
--username <your_OTX_API_Key> --password foo \
--limit 10 --begin $date1 --dest-dir <directory_where_you_want_store_stixx_files>
