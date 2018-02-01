#!/bin/bash
echo "Building image, please wait"
IMAGE_ID=$(docker build  . -q 2> /dev/null | cut -d: -f2)
if [[  -z "${IMAGE_ID}" ]]; then
    echo "Problem building the image, try with manually with : docker build ."
    exit 1
fi
docker run --rm -v $PWD:/createrepo_c ${IMAGE_ID}
