# DOCKER-VERSION	0.6.2

FROM ubuntu:12.04
MAINTAINER Nathaniel Hoag, info@nathanielhoag.com

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install g++ make python python-software-properties
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs
RUN npm install -g hubot coffee-script
RUN hubot --create .
RUN rm ./scripts/roles.coffee
RUN npm install .
RUN chmod 755 ./bin/hubot
RUN mkdir /var/hubot
RUN touch /var/hubot/brain-dump.json
RUN chmod 766 /var/hubot/brain-dump.json
ADD ./hubot-scripts.json ./hubot-scripts.json
RUN ./bin/hubot -h

ENV HUBOT_AUTH_ADMIN Shell

CMD ["bin/hubot"]

