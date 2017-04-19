![Docker Pulls](https://img.shields.io/docker/pulls/1ambda/docker-zeppelin.svg) ![Docker Stars](https://img.shields.io/docker/stars/1ambda/docker-zeppelin.svg) ![Docker Automated buil](https://img.shields.io/docker/automated/1ambda/zeppelin-docker.svg)

# docker-zeppelin

Docker images for [Apache Zeppelin](http://zeppelin.apache.org) based on ubuntu 16.04 which including 

- Java 8
- basic R packages
- basic Python packages
- miniconda3

## Supported tags and respective `Dockerfile` links

* `0.7.1` (based on [0.7.1](https://github.com/1ambda/docker-zeppelin/blob/master/0.7.1/Dockerfile))
* `0.7.0` (based on [0.7.0](https://github.com/1ambda/docker-zeppelin/blob/master/0.7.0/Dockerfile))
* `0.6.2` (based on [0.6.2](https://github.com/1ambda/docker-zeppelin/blob/master/0.6.2/Dockerfile))

## How to run 

```bash
$ docker run -it --name zeppelin --rm --net=host -p 8080:8080 -p 4000:4000 1ambda/docker-zeppelin:0.7.1
```

## Dockerfile Details

### Exposed Ports

- `8080` (zeppelin web)
- `7070` (spark master)
- `4000` (spark web) 

