FROM ubuntu:xenial
MAINTAINER 1ambda <1amb4a@gmail.com>

ENV LOG_TAG="[ZEPPELIN_BASE]:" \
    LANG=en_US.UTF-8

RUN echo "$LOG_TAG update and install basic packages" && \
    locale-gen $LANG && \
    apt-get -y update && \
    apt-get install -y software-properties-common && \
    apt -y autoclean && \
    apt -y dist-upgrade && \
    apt-get install -y build-essential

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
RUN echo "$LOG_TAG Install java8" && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

RUN echo "$LOG_TAG Cleanup" && \
    apt-get autoclean && \
    rm -rf /tmp

