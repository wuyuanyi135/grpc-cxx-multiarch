#!/bin/bash

docker tag grpc-cxx:arm64v8 wuyuanyi/grpc-cxx:arm64v8
docker tag grpc-cxx:amd64 wuyuanyi/grpc-cxx:amd64
docker tag grpc-cxx:source wuyuanyi/grpc-cxx:source

docker push wuyuanyi/grpc-cxx:arm64v8
docker push wuyuanyi/grpc-cxx:amd64
docker push wuyuanyi/grpc-cxx:source