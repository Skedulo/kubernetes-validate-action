FROM 208503650764.dkr.ecr.us-west-2.amazonaws.com/skedulo/ghcr/willthames/kubernetes-validate:v1.31.0

RUN apk add sed

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
