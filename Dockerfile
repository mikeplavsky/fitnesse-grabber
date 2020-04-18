FROM ubuntu:19.10

RUN apt-get update -y
RUN apt-get install -y wget

WORKDIR /grabber
COPY grab.sh /grabber

