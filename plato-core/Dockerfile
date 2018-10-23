FROM debian:latest

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        build-essential \
        cmake \
        git \
        libglu1-mesa \
        libgl1-mesa-dri \
        libtbb-dev \
        pkg-config \
        povray \
        python3-dev \
        python3-numpy \
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
    make install && \
    cd ../.. && \
    rm -rf get-pip.py embree-3.2.3 v3.2.3.tar.gz && \
    apt-get -y clean

LABEL maintainer="mspells@umich.edu"