#!/bin/bash
ES_HOST='localhost:9200'

if [ `docker images -q elasticsearch:SLACK_READY | wc -l` -eq 0 ]
then
    echo "building custom ES image"
    docker-compose build
fi 

docker-compose up -d

until
    curl -X GET http://${ES_HOST}/ > /dev/null 2>&1
do
    echo "Waiting for ES to be online"
    sleep 2
done

for file in `ls watcher/*.json`
do
    filename=`basename $file`
    alert_name=`basename $filename .json`

    echo "Adding/Updating ${alert_name}"
    curl -H "Content-Type: application/json"  -d @./watcher/${filename} http://${ES_HOST}/_watcher/watch/${alert_name} > /dev/null 2>&1  
done