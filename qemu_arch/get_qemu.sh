#!/usr/bin/env bash
for target_arch in aarch64 arm x86_64; do
  wget -N https://github.com/multiarch/qemu-user-static/releases/download/v2.9.1-1/x86_64_qemu-${target_arch}-static.tar.gz
  tar -xvf x86_64_qemu-${target_arch}-static.tar.gz
  rm x86_64_qemu-${target_arch}-static.tar.gz
done