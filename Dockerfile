# syntax=docker/dockerfile:1
FROM alpine:3

LABEL org.opencontainers.image.source=https://github.com/chorrell/docker-httpie

# The alpine:3 base only picks up CA bundle fixes at Alpine point releases, so
# upgrade it here to get distrusts (e.g. the eMudhra compromise) on every build.
# hadolint ignore=DL3018
RUN set -ex \
    && apk add --no-cache --upgrade ca-certificates-bundle \
    && apk add --no-cache py3-setuptools httpie

COPY --link docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["http"]
