#!bin/bash

: "${SLACK_ALERT_P1:?Set SLACK_ALERT_P1 using --env}"
: "${SLACK_ALERT_P2:?Set SLACK_ALERT_P2 using --env}"
: "${PAGERDUTY_KEY:?Set PAGERDUTY_KEY using --env}"


bin/elasticsearch-keystore create &&\
echo ${SLACK_ALERT_P1} | bin/elasticsearch-keystore add --stdin xpack.notification.slack.account.alert_p1.secure_url &&\
echo ${SLACK_ALERT_P2} | bin/elasticsearch-keystore add --stdin xpack.notification.slack.account.alert_p2.secure_url &&\
echo ${PAGERDUTY_KEY} | bin/elasticsearch-keystore add --stdin xpack.notification.pagerduty.account.uptime.secure_service_api_key

exec /usr/local/bin/docker-entrypoint.sh
