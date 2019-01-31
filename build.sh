#!/bin/bash 
for i in "$@"
do
case $i in
    --build-source)
    BUILD_SOURCE=1

    shift # past argument=value
    ;;
    -v=*|--version=*)
    VERSION="${i#*=}"
    shift
    ;;
    *)
          # unknown option
    ;;
esac 
done

if [[ -z $VERSION ]]; then
	echo "Version not specified"
	exit 1
fi
bash ./build_dockerfiles.sh

if [[ ! -z $BUILD_SOURCE ]]; then
	docker build . -f Dockerfile.source --rm --compress --squash -t wuyuanyi/grpc-cxx:${VERSION}-source -t wuyuanyi/grpc-cxx:latest-source --build-arg VERSION=${VERSION}
else
    echo "Skip build source image"
fi
docker build . -f Dockerfile.amd64 -t wuyuanyi/grpc-cxx:${VERSION}-amd64 -t wuyuanyi/grpc-cxx:latest-amd64 --compress --squash
docker build . -f Dockerfile.arm64v8 -t wuyuanyi/grpc-cxx:${VERSION}-arm64v8 -t wuyuanyi/grpc-cxx:latest-arm64v8 --compress --squash
