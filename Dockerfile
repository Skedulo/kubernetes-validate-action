FROM python:3.10-alpine3.17

RUN apk add sed
RUN pip install kubernetes-validate==1.23.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
