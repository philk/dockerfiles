FROM ubuntu:14.04
MAINTAINER "Phil Kates <me@philkates.com>"

ENV DEBIAN_FRONTEND noninteractive

ADD nginx_signing.key /
RUN apt-key add nginx_signing.key
RUN echo "deb http://nginx.org/packages/ubuntu/ trusty nginx\ndeb-src http://nginx.org/packages/ubuntu/ trusty nginx" > /etc/apt/sources.list.d/nginx.list

RUN apt-get update && apt-get upgrade -y -q
RUN apt-get -y -q install wget curl nginx && apt-get clean
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

ENV KIBANA_VERSION 3.1.0
RUN mkdir /opt/kibana
WORKDIR /opt/kibana
RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz
RUN tar --strip-components=1 -zxf kibana-$KIBANA_VERSION.tar.gz && rm kibana-$KIBANA_VERSION.tar.gz
RUN cp app/dashboards/logstash.json app/dashboards/default.json

RUN rm /etc/nginx/conf.d/*
ADD kibana.conf /etc/nginx/conf.d/
ADD run.sh /opt/kibana/run.sh
EXPOSE 8080

CMD ["./run.sh"]
