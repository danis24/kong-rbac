FROM kong:1.3.0-alpine
MAINTAINER Danis Yogaswara <danis@aniqma.com>

ENV KONG_VERSION 1.3.0
ENV KONG_IMAGES_TAG 1.3.0
ENV KONG_DATABASE postgres
ENV KONG_PLUGINS 'bundled, rbac'

RUN apk add --no-cache --virtual .build-deps git \
  && luarocks install --server=http://luarocks.org/manifests/danis24 kong-plugin-rbac ${KONG_IMAGES_TAG} \
  && apk del .build-deps
