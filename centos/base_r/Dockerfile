FROM 1ambda/docker-zeppelin:centos-base
MAINTAINER 1ambda <1amb4a@gmail.com>

ENV LOG_TAG="[ZEPPELIN_BASE_R]:"

ENV R_LIBS="/usr/local/rbin/R"
RUN echo "$LOG_TAG Install R related packages" && \
    mkdir -p ${R_LIBS} && \
    echo "R_LIBS=/${R_LIBS}" >> ${R_LIBS}/.Renviron && \
    R -e "install.packages('knitr', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('ggplot2', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('googleVis', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('data.table', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    # for devtools, Rcpp
    yum install libcurl-devel openssl-devel -y && \
    R -e "install.packages('devtools', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    R -e "install.packages('Rcpp', repos='http://cran.us.r-project.org', lib='$R_LIBS')" && \
    Rscript -e "library('devtools', lib.loc='$R_LIBS'); library('Rcpp', lib.loc='$R_LIBS'); devtools::install_github('ramnathv/rCharts', lib='$R_LIBS')"

RUN echo "$LOG_TAG Cleanup" && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /tmp
