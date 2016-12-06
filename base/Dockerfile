FROM openjdk:8u111-jdk-alpine

ENV LOG_TAG="[ZEPPELIN_BASE]:" \
    R_VERSION="3.3.1-r0" \
    R_LIBS="/usr/local/rbin/R"

RUN echo "$LOG_TAG Install required packages" && \
        apk add --update bash curl build-base make gcc g++ && \
    echo "$LOG_TAG Install python related packages" && \
        # https://github.com/docker-library/python/issues/112
        ln -s /usr/include/locale.h /usr/include/xlocale.h && \
        apk add --update musl-dev linux-headers gfortran libpng-dev freetype-dev libxml2-dev libxslt-dev && \
        apk add --update python python-dev py-pip && \
        pip install --upgrade pip && \
        pip install numpy && \
        pip install matplotlib && \
    echo "$LOG_TAG Install R related packages" && \
        mkdir -p $R_LIBS && \
        echo 'R_LIBS=$R_LIBS' >> $R_LIBS/.Renviron && \
        curl --silent --location https://github.com/sgerrand/alpine-pkg-R/releases/download/${R_VERSION}/R-${R_VERSION}.apk --output /var/cache/apk/R-${R_VERSION}.apk && \
        apk add --update --allow-untrusted /var/cache/apk/R-${R_VERSION}.apk && \
        curl --silent --location https://github.com/sgerrand/alpine-pkg-R/releases/download/${R_VERSION}/R-dev-${R_VERSION}.apk --output /var/cache/apk/R-dev-${R_VERSION}.apk && \
        apk add --update --allow-untrusted /var/cache/apk/R-dev-${R_VERSION}.apk && \
        R -e "install.packages('knitr', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
        R -e "install.packages('ggplot2', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
        R -e "install.packages('googleVis', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
        R -e "install.packages('data.table', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    echo "$LOG_TAG cleanup" && \
        apk del curl build-base make gcc g++ \
                musl-dev linux-headers gfortran libpng-dev freetype-dev libxml2-dev libxslt-dev && \
        rm -rf /var/cache/apk/*

