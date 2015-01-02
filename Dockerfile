# DOCKER-VERSION	1.3.2

FROM ubuntu:14.04
MAINTAINER Nathaniel Hoag, info@nathanielhoag.com

ENV BOTVERSION 0.0.3
ENV BOTDIR /opt/bot-${BOTVERSION}
ENV BOTARCHIVE https://github.com/nhoag/bot/archive/${BOTVERSION}.tar.gz

RUN apt-get update && \
  apt-get install -y wget && \
  wget -q -O - https://deb.nodesource.com/setup | sudo bash - && \
  apt-get install -y build-essential nodejs && \
  rm -rf /var/lib/apt/lists/* && \
  wget -q -O - ${BOTARCHIVE} | tar xz -C /opt

WORKDIR ${BOTDIR}

RUN npm install
