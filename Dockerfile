# syntax=docker.io/docker/dockerfile:1.4.0
FROM alpine:3

LABEL org.opencontainers.image.source https://github.com/chorrell/docker-httpie

RUN set -ex \
    && apk add --no-cache py3-setuptools httpie

COPY --link docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["http"]
