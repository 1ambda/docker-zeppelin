FROM centos:centos7
MAINTAINER 1ambda <1amb4a@gmail.com>

ENV LOG_TAG="[ZEPPELIN_BASE]:"

RUN yum install epel-release -y && \
    yum install wget git tar R -y

ENV JAVA_PREFIX="8u65-b17" \
    JAVA_VERSION="jdk-8u65-linux-x64" \
    JAVA_HOME=/usr/java/default/
RUN echo "$LOG_TAG Install java8" && \
    wget --no-check-certificate --no-cookies --header 'Cookie:oraclelicense=accept-securebackup-cookie' \
        http://download.oracle.com/otn-pub/java/jdk/${JAVA_PREFIX}/${JAVA_VERSION}.rpm && \
    rpm -Uvh ${JAVA_VERSION}.rpm && \
    rm -rf ${JAVA_VERSION}.rpm

RUN echo "$LOG_TAG Cleanup" && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /tmp
