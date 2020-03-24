FROM docker.elastic.co/elasticsearch/elasticsearch:7.6.0

COPY es/entrypoint.sh bin/entrypoint.sh
COPY configs/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
USER root
RUN chown elasticsearch:elasticsearch bin/entrypoint.sh && chmod 0750 bin/entrypoint.sh
USER elasticsearch

CMD ["/bin/bash", "bin/entrypoint.sh"]