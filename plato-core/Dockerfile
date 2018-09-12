FROM debian:latest

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        git \
        libglu1-mesa \
        libgl1-mesa-dri \
        povray \
        python3-numpy \
        python3-scipy \
        python3-matplotlib \
        python3-venv \
        wget \
        xvfb \
        && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    apt-get -y clean

LABEL maintainer="mspells@umich.edu"