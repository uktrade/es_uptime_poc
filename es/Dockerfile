FROM docker.elastic.co/elasticsearch/elasticsearch:7.6.0

ARG SLACK_ALERT_P1
ARG SLACK_ALERT_P2
ARG PAGERDUTY_KEY

ENV SLACK_ALERT_P1=${SLACK_ALERT_P1}
ENV SLACK_ALERT_P2=${SLACK_ALERT_P2}
ENV PAGERDUTY_KEY=${PAGERDUTY_KEY}

RUN bin/elasticsearch-keystore create &&\
    echo ${SLACK_ALERT_P1} | bin/elasticsearch-keystore add --stdin xpack.notification.slack.account.alert_p1.secure_url &&\
    echo ${SLACK_ALERT_P2} | bin/elasticsearch-keystore add --stdin xpack.notification.slack.account.alert_p2.secure_url &&\
    echo ${PAGERDUTY_KEY} | bin/elasticsearch-keystore add --stdin xpack.notification.pagerduty.account.uptime.secure_service_api_key
