FROM ubuntu:14.04
MAINTAINER "Phil Kates <me@philkates.com>"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y -q
RUN apt-get -y -q install wget curl && apt-get clean

# install Java 7
RUN wget --no-cookies --header 'Cookie: oraclelicense=accept-securebackup-cookie' http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz
RUN tar zxf jdk-7u55-linux-x64.tar.gz; rm jdk-7u55-linux-x64.tar.gz
RUN mv jdk1.7.0_55 /opt
RUN update-alternatives --install '/usr/bin/java' 'java' '/opt/jdk1.7.0_55/bin/java' 9999
ENV JAVA_HOME /opt/jdk1.7.0_55

# install Logstash
ENV LOGSTASH_HOME /opt/logstash
ENV LOGSTASH_VERSION 1.4.1

WORKDIR /opt/logstash

RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz
RUN tar --strip-components=1 -zxf logstash-$LOGSTASH_VERSION.tar.gz && rm logstash-$LOGSTASH_VERSION.tar.gz

RUN mkdir -p /opt/logstash/tmp /opt/logstash/etc
RUN ./bin/plugin install contrib

VOLUME /opt/logstash/etc

CMD ["agent", "-f", "/opt/logstash/etc/logstash.conf"]
ENTRYPOINT ["/opt/logstash/bin/logstash"]
