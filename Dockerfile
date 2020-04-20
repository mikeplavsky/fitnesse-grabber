FROM ubuntu:19.10

RUN apt-get update -y

RUN apt-get install -y wget
RUN apt-get install -y unzip

RUN wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install 

WORKDIR /grabber
COPY grab.sh /grabber

