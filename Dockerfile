FROM python:3.7

MAINTAINER Srikalyan Swayampakula <srikalyansswayam@gmail.com>

RUN apt-get update && \
    apt-get install  --assume-yes --install-recommends=no python-dev build-essential emacs jq

RUN pip install httpie "uwsgi>=2.0.13.1,<3.0.0"

RUN mkdir /service

WORKDIR /service

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
