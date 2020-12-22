ARG HELM_VERSION=3.4.1

FROM alpine/helm:${HELM_VERSION}

RUN apk add --update --no-cache git libressl ca-certificates \
    && helm plugin install https://github.com/chartmuseum/helm-push \
    && apk del git \
    && rm -f /var/cache/apk/*
