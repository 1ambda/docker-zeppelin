FROM 1ambda/docker-zeppelin:alpine-base
MAINTAINER 1ambda <1amb4a@gmail.com>

ENV Z_VERSION="0.6.2"
ENV LOG_TAG="[ZEPPELIN_${Z_VERSION}]:" \
    Z_HOME="/zeppelin"

RUN echo "$LOG_TAG install zeppelin ${Z_VERSION}" && \
    wget http://archive.apache.org/dist/zeppelin/zeppelin-${Z_VERSION}/zeppelin-${Z_VERSION}-bin-all.tgz && \
    tar -zxvf /zeppelin-${Z_VERSION}-bin-all.tgz && \
    rm -rf /zeppelin-${Z_VERSION}-bin-all.tgz && \
    mv /zeppelin-${Z_VERSION}-bin-all ${Z_HOME}

EXPOSE 8080 7077

WORKDIR ${Z_HOME}
CMD ["bin/zeppelin.sh"]
