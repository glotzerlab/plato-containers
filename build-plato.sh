#!/bin/sh
set -e

OWNER=mspells
TAG=$(date +%Y%m%d)

core_tag="${OWNER}/plato-core:${TAG}"
latest_tag="${OWNER}/plato-core:latest"
docker build -f plato-core/Dockerfile -t "${core_tag}" .
docker tag "${core_tag}" "${latest_tag}"
docker push "${core_tag}"
docker push "${latest_tag}"

TAG=$(date +%Y%m%d)
tests_tag="${OWNER}/plato-tests:${TAG}"
latest_tag="${OWNER}/plato-tests:latest"
docker build -f plato-tests/Dockerfile -t "${tests_tag}" .
docker tag "${tests_tag}" "${latest_tag}"
docker push "${tests_tag}"
docker push "${latest_tag}"
