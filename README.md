# ES Watcher Uptime POC

Purpose To test
## Prequisites
- docker
- docker-compose
- slack channels ( with webhook integration)

## configuration

Populate .env file in Project root directory with following content

```
TAG=<your custom ES Image Tag>
ELASTIC_SEARCH_HOSTS="elasticsearch:9200"
KIBANA_HOST="kibana:5601"
DEBUG_LEVEL="Info"
SLACK_ALERT_P1=https://hooks.slack.com/services/<your>/<hook>
SLACK_ALERT_P2=https://hooks.slack.com/services/<your>/<hook>
P1_URLS=https://<your.P1domian1.com>,https://<your.P1domain2.com>
P2_URLS=https://<your.P2domian1.com>,https://<your.P2domain2.com>
```

## Usage
 - once configured all environment variables, simply execute `./start.sh ` and, visit [Kibana](http://localhost:5601)
 - ```./stop.sh``` when you're done.
 