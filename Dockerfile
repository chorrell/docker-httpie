FROM alpine:3

RUN set -ex \
    && apk add --no-cache httpie

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["http"]
