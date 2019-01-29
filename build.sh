#!/bin/bash 
for i in "$@"
do
case $i in
    --build-source)
    BUILD_SOURCE=1

    shift # past argument=value
    ;;
    *)
          # unknown option
    ;;
esac
done

bash ./build_dockerfiles.sh

if [[ ! -z $BUILD_SOURCE ]]; then
	docker build . -f Dockerfile.source -t wuyuanyi/grpc-cxx:source
else
    echo "Skip build source image"
fi
docker build . -f Dockerfile.amd64 -t wuyuanyi/grpc-cxx:amd64
docker build . -f Dockerfile.arm64v8 -t wuyuanyi/grpc-cxx:arm64v8 
