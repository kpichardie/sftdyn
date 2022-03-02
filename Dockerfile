FROM ubuntu:20.04

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y tzdata
RUN apt-get install -y python3 python3-pip 
RUN apt-get install -y bind9 bind9-dnsutils
RUN pip3 install aiohttp 
RUN pip3 install sftdyn

run mkdir ./app
COPY ./ ./app

WORKDIR /app

RUN python3 ./setup.py install
RUN cp /etc/bind/db.empty /etc/bind/dyn.sft.mx.zone

