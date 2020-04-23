#!/bin/sh
set -e

OWNER=mspells
TAG=$(date +%Y%m%d)

for package in plato-core plato-tests plato-live;do
  cd $package
  core_tag="${OWNER}/${package}:${TAG}"
  latest_tag="${OWNER}/${package}:latest"
  docker build -t "${core_tag}" .
  docker tag "${core_tag}" "${latest_tag}"
  docker push "${core_tag}"
  docker push "${latest_tag}"
  cd ..
done
