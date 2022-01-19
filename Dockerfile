FROM python:3.10.1-alpine3.15

RUN apk add sed
RUN pip install kubernetes-validate==1.23.1

USER 1000

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
