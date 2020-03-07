#!/bin/bash
ES_HOST='localhost:9200'
KIBANA_HOST='localhost:5601'

if [ ! -f .env ]
then
 echo "Please Create .env file with suggested environment variables"
 exit;
fi

TAG=`grep TAG .env | awk -F '=' '{print $2}'`

if [ `docker images -q elasticsearch:${TAG} | wc -l` -eq 0 ]
then
    docker-compose build
fi 

docker-compose up -d

until
    curl -X GET http://${ES_HOST}/ > /dev/null 2>&1
do
    echo "Waiting for ES to be online"
    sleep 2
done

for file in `ls ./configs/watcher/*.json`
do
    filename=`basename $file`
    alert_name=`basename $filename .json`

    echo "Adding/Updating ${alert_name}"
    curl -H "Content-Type: application/json"  -d @./configs/watcher/${filename} http://${ES_HOST}/_watcher/watch/${alert_name} > /dev/null 2>&1  
done

until
    curl -X GET http://${KIBANA_HOST}/ > /dev/null 2>&1
do
    echo "Waiting for Kibana to be online"
    sleep 2
done