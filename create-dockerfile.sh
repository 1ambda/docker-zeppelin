#!/usr/bin/env bash

if [ $# -lt 1 ];
then
    echo "USAGE: $0 version (e.g. 0.7.0)"
    exit 1
fi

tag="[CREATE-DOCKERFILE]"
version=$1
dirName="bin-all-${version}"

if [ ! -d "$dirName" ]; then
    echo "${tag} Creating Directory: ${dirName}"
    mkdir -p ${dirName}

    echo "${tag} Copying File: ${dirName}/Dockerfile"
    cp Dockerfile.template ${dirName}/Dockerfile

    echo "${tag} Set Version: ${version}"
    sed -i '' -e "s/Z_VERSION=\"0.0.0\"/Z_VERSION=\"${version}\"/g" ${dirName}/Dockerfile
else
    echo "${tag} Directory already exists: ${dirName}"
fi






