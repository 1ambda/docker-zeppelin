FROM 1ambda/docker-zeppelin:alpine-base
MAINTAINER 1ambda <1amb4a@gmail.com>

ENV LOG_TAG="[ZEPPELIN_BASE_R]:" \
    LANG=C.UTF-8 \
    R_VERSION="3.3.1-r0" \
    R_LIBS="/usr/local/rbin/R"

RUN echo "$LOG_TAG Install required packages" && \
    apk add --update --virtual=build_deps build-base make gcc g++ tar

RUN echo "$LOG_TAG Install R related packages" && \
    mkdir -p $R_LIBS && \
    echo 'R_LIBS=$R_LIBS' >> $R_LIBS/.Renviron && \
    curl --silent --location https://github.com/sgerrand/alpine-pkg-R/releases/download/${R_VERSION}/R-${R_VERSION}.apk \
         --output /var/cache/apk/R-${R_VERSION}.apk && \
    apk add --no-cache --allow-untrusted /var/cache/apk/R-${R_VERSION}.apk && \
    curl --silent --location https://github.com/sgerrand/alpine-pkg-R/releases/download/${R_VERSION}/R-dev-${R_VERSION}.apk \
         --output /var/cache/apk/R-dev-${R_VERSION}.apk && \
    apk add --no-cache --allow-untrusted /var/cache/apk/R-dev-${R_VERSION}.apk && \
    R -e "install.packages('knitr', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('ggplot2', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('googleVis', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('data.table', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    # for devtools, Rcpp
    apk add --no-cache --virtual=r_build_deps curl-dev openssl-dev -y && \
    R -e "install.packages('devtools', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('Rcpp', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    Rscript -e "library('devtools', lib.loc='$R_LIBS'); library('Rcpp', lib.loc='$R_LIBS'); devtools::install_github('ramnathv/rCharts', lib='$R_LIBS')"

RUN echo "$LOG_TAG Install python related packages" && \
        # for numpy: https://github.com/docker-library/python/issues/112
        ln -s /usr/include/locale.h /usr/include/xlocale.h && \
        apk add --no-cache --virtual=python_deps \
            py-numpy freetype libpng tk tcl && \
        apk add --no-cache --virtual=python_build_deps \
            musl-dev linux-headers gfortran \
            freetype-dev py-numpy-dev@testing \
            py-numpy python-dev libpng-dev libxml2-dev libxslt-dev \
            tk-dev tcl-dev

RUN R -e "install.packages('gridSVG', repos='http://cran.us.r-project.org', lib='$R_LIBS')"

RUN echo "$LOG_TAG Cleanup" && \
        apk del build_deps && \
        apk del r_build_deps && \
        rm -rf /tmp
