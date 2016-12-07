FROM 1ambda/docker-zeppelin:centos-base
MAINTAINER 1ambda <1amb4a@gmail.com>

ENV LOG_TAG="[ZEPPELIN_BASE_PYTHON]:"

RUN echo "$LOG_TAG Install python related packages" && \
    yum install python-setuptools python-dev python-numpy -y && \
    yum install python-pip.noarch python-devel libpng-devel tkinter -y && \
    easy_install py4j && \
    pip install numpy && \
    pip install matplotlib

RUN echo "$LOG_TAG Cleanup" && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /tmp
