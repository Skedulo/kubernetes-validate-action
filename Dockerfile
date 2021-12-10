FROM python:3.10.1-alpine3.15

RUN pip install kubernetes-validate==1.22.1rc2

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
