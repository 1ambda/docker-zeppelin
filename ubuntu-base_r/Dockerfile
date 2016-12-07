FROM ubuntu:xenial
MAINTAINER 1ambda <1amb4a@gmail.com>

ENV LOG_TAG="[ZEPPELIN_BASE_R]:"

# https://www.r-bloggers.com/how-to-install-r-on-linux-ubuntu-16-04-xenial-xerus/
ENV R_LIBS="/usr/local/rbin/R"
RUN echo "$LOG_TAG Install R related packages" && \
    mkdir -p $R_LIBS && \
    echo 'R_LIBS=$R_LIBS' >> $R_LIBS/.Renviron && \
    echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | tee -a /etc/apt/sources.list && \
    gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 && \
    gpg -a --export E084DAB9 | apt-key add - && \
    apt-get -y update && \
    apt-get -y install r-base r-base-dev && \
    R -e "install.packages('knitr', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('ggplot2', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('googleVis', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('data.table', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    # for devtools, Rcpp
    apt-get -y install libcurl4-gnutls-dev libssl-dev && \
    R -e "install.packages('devtools', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('Rcpp', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    Rscript -e "library('devtools', lib.loc=\"$R_LIBS\"); library('Rcpp', lib.loc=\"$R_LIBS\"); install_github('ramnathv/rCharts', lib=\"$R_LIBS\")"

RUN echo "$LOG_TAG Cleanup" && \
    apt-get autoclean && \
    rm -rf /tmp

