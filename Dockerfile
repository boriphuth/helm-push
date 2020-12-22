ARG HELM_VERSION=3.4.1

FROM alpine/helm:${HELM_VERSION}

RUN apk add --update --no-cache git libressl ca-certificates \
    && helm plugin install https://github.com/chartmuseum/helm-push \
    && helm plugin install https://github.com/databus23/helm-diff \
    && apk del git \
    && rm -f /var/cache/apk/*
