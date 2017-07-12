![Docker Pulls](https://img.shields.io/docker/pulls/1ambda/docker-zeppelin.svg) ![Docker Stars](https://img.shields.io/docker/stars/1ambda/docker-zeppelin.svg) ![Docker Automated buil](https://img.shields.io/docker/automated/1ambda/zeppelin-docker.svg)

# Deprecated, Please use the official image.

https://hub.docker.com/r/apache/zeppelin/

For example,

```sh
docker run -p 8080:8080 --rm -v $PWD/logs:/logs -v $PWD/notebook:/notebook -e ZEPPELIN_LOG_DIR='/logs' -e ZEPPELIN_NOTEBOOK_DIR='/notebook' --name zeppelin apache/zeppelin:0.7.2
```

# docker-zeppelin

All-in-one Docker image for [Apache Zeppelin](http://zeppelin.apache.org) based on ubuntu with

- **Java 8**
- **R** with basic packages
- **Python 2** with basic packages (but it's recommended to use [%python.conda](http://zeppelin.apache.org/docs/0.7.1/interpreter/python.html#conda) in Zeppelin)
- **miniconda2** for [conda interpreter](http://zeppelin.apache.org/docs/0.7.1/interpreter/python.html#conda) in Zeppelin

## Supported tags

* `0.7.1` (based on [0.7.1](https://github.com/1ambda/docker-zeppelin/blob/master/0.7.1/Dockerfile))
* `0.7.0` (based on [0.7.0](https://github.com/1ambda/docker-zeppelin/blob/master/0.7.0/Dockerfile))
* `0.6.2` (based on [0.6.2](https://github.com/1ambda/docker-zeppelin/blob/master/0.6.2/Dockerfile))

## How to run 

```bash
$ docker run -it --name zeppelin --rm -p 8080:8080 1ambda/docker-zeppelin:0.7.1
```

If you want to see other interpreters' logs

```bash
$ docker exec -it zeppelin-0.7.1 bash   # localhost terminal
$ tail -F logs/*                        # inside docker container 
```

Additionally, you can set `logs` and `notebook` dirs like

```bash
$ docker run -it --name zeppelin --rm -p 8080:8080 \ 
-v $PWD/logs:/logs \ 
-v $PWD/notebook:/notebook \
-e ZEPPELIN_NOTEBOOK_DIR='/notebook' \
-e ZEPPELIN_LOG_DIR='/logs' \
--name zeppelin 1ambda/docker-zeppelin:0.7.1
```

## Install additional python, R packages

It's recommended to use [%python.conda](http://zeppelin.apache.org/docs/0.7.1/interpreter/python.html#conda) in Zeppelin, instead of installing packages for local python

```bash
$ docker exec -it zeppelin-0.7.1 bash   # localhost terminal

# install python packages inside docker container
$ pip install flask

# install R packages inside docker container
$ R -e "install.packages('knitr', repos='http://cran.us.r-project.org')"
```

## Tips

### Networking with systems on other hosts

Docker container can't connect external system if they are not on the same docker network. (e.g containers launched by docker-compose)  
So if you want to connect other systems you can use `--net=host` option, but [it might not work for OSX](https://github.com/docker/for-mac/issues/68) 

