FROM python:3.7

MAINTAINER Srikalyan Swayampakula <srikalyansswayam@gmail.com>

RUN apt-get update && \
    apt-get install  --assume-yes --install-recommends=no python-dev build-essential emacs jq

RUN pip install httpie

RUN mkdir /service

WORKDIR /service
