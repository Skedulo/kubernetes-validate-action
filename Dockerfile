FROM ghcr.io/willthames/kubernetes-validate:v1.29.1-0

RUN apk add sed

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
