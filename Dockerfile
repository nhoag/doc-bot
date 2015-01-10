# DOCKER-VERSION	1.3.2

FROM nhoag/nodejs
MAINTAINER Nathaniel Hoag, info@nathanielhoag.com

ENV BOTVERSION 0.0.4
ENV BOTDIR /opt/bot-${BOTVERSION}
ENV BOTARCHIVE https://github.com/nhoag/bot/archive/${BOTVERSION}.tar.gz

RUN wget -q -O - ${BOTARCHIVE} | tar xz -C /opt

WORKDIR ${BOTDIR}

RUN npm install
