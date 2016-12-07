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

BASE_DIR="${LINUX}-${VERSION}${POSTFIX}"
DOCKER_TAG="${LINUX}-${VERSION}${POSTFIX}"

if [ ! -d "$BASE_DIR" ]; then
    echo "${TAG} Creating Directory: ${BASE_DIR}"
    mkdir -p ${BASE_DIR}

    echo "${TAG} Copying File: ${BASE_DIR}/Dockerfile"
    cp Dockerfile.template ${BASE_DIR}/Dockerfile

    echo "${TAG} Set Version: ${VERSION}"
    sed -i '' -e "s/Z_VERSION=\"0.0.0\"/Z_VERSION=\"${VERSION}\"/g" ${BASE_DIR}/Dockerfile
    sed -i '' -e "s/docker-zeppelin:tag/docker-zeppelin:${DOCKER_TAG}/g" ${BASE_DIR}/Dockerfile
else
    echo "${TAG} Directory already exists: ${BASE_DIR}"
fi






