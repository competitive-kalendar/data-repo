#!/bin/bash
path=/update_log
echo -e "\n\n"  >> $path

date >> $path

echo -e "AWS\n" >> $path

curl -X POST "http://$IP_backend/update?platform=all">> $path
