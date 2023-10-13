FROM python:3.12.0-alpine3.18

RUN apk add sed
RUN pip install 'kubernetes-validate>1.27,<1.28'

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
