#!/usr/bin/env bash

if [ $# -lt 2 ];
then
    echo "USAGE: $0 version linux platform"
    echo "example: $0 0.7.0 alpine python"
    exit 1
fi

TAG="[CREATE-DOCKERFILE]"
VERSION=$1
LINUX=$2
PLATFORM=$3
POSTFIX=""

if [[ ! "x${PLATFORM}" = "x" ]]; then
   POSTFIX="_${PLATFORM}"
fi

BASE_DIR="${LINUX}/base${POSTFIX}"

if [ ! -d "$BASE_DIR" ]; then
    echo "${TAG} Base Directory doesn't exist: ${BASE_DIR}"
    exit 1
fi

DOCKER_DIR="${LINUX}/${VERSION}${POSTFIX}"
BASE_IMAGE_TAG="${LINUX}-base${POSTFIX}"

if [ ! -d "$DOCKER_DIR" ]; then
    echo "${TAG} Creating Directory: ${DOCKER_DIR}"
    mkdir -p ${DOCKER_DIR}

    echo "${TAG} Copying File: ${DOCKER_DIR}/Dockerfile"
    cp Dockerfile.template ${DOCKER_DIR}/Dockerfile

    echo "${TAG} Set Base Image Tag: ${TAG}"
    sed -i '' -e "s/docker-zeppelin:tag/docker-zeppelin:${BASE_IMAGE_TAG}/g" ${DOCKER_DIR}/Dockerfile
    echo "${TAG} Set Version: ${VERSION}"
    sed -i '' -e "s/Z_VERSION=\"0.0.0\"/Z_VERSION=\"${VERSION}\"/g" ${DOCKER_DIR}/Dockerfile
else
    echo "${TAG} Directory already exists: ${DOCKER_DIR}"
fi






