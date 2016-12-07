![Docker Pulls](https://img.shields.io/docker/pulls/1ambda/docker-zeppelin.svg) ![Docker Stars](https://img.shields.io/docker/stars/1ambda/docker-zeppelin.svg) ![Docker Automated buil](https://img.shields.io/docker/automated/1ambda/zeppelin-docker.svg)

# docker-zeppelin

Docker images for [Apache Zeppelin](http://zeppelin.apache.org) on various platforms (alpine, centos, ubuntu)

## Supported tags and respective `Dockerfile` links

### Alpine

* `alpine-0.6.2` (based on [alpine/base/Dockerfile](https://github.com/1ambda/docker-zeppelin/blob/master/alpine/base/Dockerfile))
* `alpine-0.6.2_r` (based on [alpine/base_r/Dockerfile](https://github.com/1ambda/docker-zeppelin/blob/master/alpine/base_r/Dockerfile))
* `alpine-0.6.2_python` (based on [alpine/base_python/Dockerfile](https://github.com/1ambda/docker-zeppelin/blob/master/alpine/base_python/Dockerfile))

Since alpine linux doesn't have graphical device, some function may not work (e.g `plot` in R) 

## How to run

Publish ports 8080 (web) and 7077 (spark master)

```bash
$ docker run -it --name zeppelin --rm \ 
  -p 8080:8080 -p 7077:7077 \
  1ambda/docker-zeppelin:alpine-0.6.2_r
```
