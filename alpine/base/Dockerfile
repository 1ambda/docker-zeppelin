FROM alpine:3.4
MAINTAINER 1ambda <1amb4a@gmail.com>

ENV LOG_TAG="[ZEPPELIN_BASE]:" \
    LANG=C.UTF-8 \
    DUMBINIT_VERSION="1.2.0"

RUN echo "$LOG_TAG Install basic packages" && \
    apk update && \
    echo "http://dl-1.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-5.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-6.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache bash dumb-init git curl wget

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin \
    JAVA_VERSION=8u111 \
    JAVA_ALPINE_VERSION=8.111.14-r0

RUN echo "$LOG_TAG Install java ${JAVA_VERSION}" && \
    { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home && \
	chmod +x /usr/local/bin/docker-java-home && \
    set -x && \
    apk add --no-cache openjdk8="$JAVA_ALPINE_VERSION" && \
    [ "$JAVA_HOME" = "$(docker-java-home)" ]

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

RUN echo "$LOG_TAG Cleanup" && \
        rm -rf /var/cache/apk/*

