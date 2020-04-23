FROM debian:buster-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        build-essential \
        cmake \
        cython3 \
        git \
        libglu1-mesa \
        libgl1-mesa-dri \
        libtbb-dev \
        pkg-config \
        povray \
        python3-dev \
        python3-numpy \
        python3-pybind11 \
        python3-scipy \
        python3-matplotlib \
        python3-venv \
        wget \
        xvfb \
        && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    wget https://github.com/embree/embree/archive/v3.2.3.tar.gz && \
    tar xf v3.2.3.tar.gz && \
    mkdir embree-3.2.3/build && \
    cd embree-3.2.3/build && \
    cmake .. -DEMBREE_ISPC_SUPPORT=off -DEMBREE_TUTORIALS=off -DCMAKE_INSTALL_PREFIX=/usr && \
    make -j$(nproc) install && \
    cd ../.. && \
    rm -rf get-pip.py embree-3.2.3 v3.2.3.tar.gz && \
    apt-get -y clean

LABEL maintainer="mspells@umich.edu" \
    org.opencontainers.image.authors="Matthew Spellings <mspells@umich.edu>" \
    org.opencontainers.image.description="Core infrastructure to run plato unit tests on CircleCI." \
    org.opencontainers.image.documentation="https://github.com/glotzerlab/plato-containers" \
    org.opencontainers.image.source="https://github.com/glotzerlab/plato-containers" \
    org.opencontainers.image.title="Plato-core" \
    org.opencontainers.image.url="https://github.com/glotzerlab/plato-containers"
