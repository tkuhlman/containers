FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y wget
WORKDIR /
RUN wget https://allmark.io/bin/linux/amd64/allmark
RUN chmod +x /allmark
