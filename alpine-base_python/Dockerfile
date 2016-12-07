FROM 1ambda/docker-zeppelin:base-alpine
MAINTAINER 1ambda <1amb4a@gmail.com>

ENV LOG_TAG="[ZEPPELIN_BASE_PYTHON]:"

RUN echo "$LOG_TAG Install required packages" && \
    echo @testing http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache --virtual=build_deps build-base make gcc g++ tar

RUN echo "$LOG_TAG Install python related packages" && \
        # for numpy: https://github.com/docker-library/python/issues/112
        ln -s /usr/include/locale.h /usr/include/xlocale.h && \
        apk add --no-cache --virtual=python_deps \
            py-numpy freetype libpng tk tcl && \
        apk add --no-cache --virtual=python_build_deps \
            musl-dev linux-headers gfortran \
            freetype-dev py-numpy-dev@testing \
            py-numpy python-dev libpng-dev libxml2-dev libxslt-dev \
            tk-dev tcl-dev && \
        apk add --no-cache python py-pip && \
        pip install --no-cache-dir --upgrade pip && \
        pip install --no-cache-dir numpy matplotlib

RUN echo "$LOG_TAG Cleanup" && \
        apk del build_deps && \
        apk del python_build_deps
