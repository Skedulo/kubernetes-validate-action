FROM python:3.10-alpine3.17

RUN apk add sed
RUN pip install 'kubernetes-validate>1.25,<1.26'

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
