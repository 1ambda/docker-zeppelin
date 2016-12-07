FROM ubuntu:xenial
MAINTAINER 1ambda <1amb4a@gmail.com>

ENV LOG_TAG="[ZEPPELIN_BASE_PYTHON]:"

# http://chrisstrelioff.ws/sandbox/2014/06/04/install_and_setup_python_and_packages_on_ubuntu_14_04.html
RUN echo "$LOG_TAG Install python related packages" && \
    apt-get update && \
    apt-get install -y python-dev python-pip && \
    apt-get install -y gfortran && \
    # numerical/algebra packages
    apt-get install -y libblas-dev libatlas-dev liblapack-dev && \
    # font, image for matplotlib
    apt-get install -y libpng-dev libfreetype6-dev libxft-dev && \
    # for tkinter
    apt-get install -y python-tk libxml2-dev libxslt-dev zlib1g-dev && \
    pip install numpy && \
    pip install matplotlib

RUN echo "$LOG_TAG Cleanup" && \
    apt-get autoclean && \
    rm -rf /tmp

