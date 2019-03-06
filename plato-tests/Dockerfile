FROM mspells/plato-core

RUN pip3 install pyglet vispy==0.5.3 nose && \
    git clone --recursive https://github.com/glotzerlab/fresnel && \
    mkdir fresnel/build && \
    cd fresnel/build && \
    git checkout v0.8.0 && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local/lib/python3.5/dist-packages && \
    make install && \
    cd / && \
    rm -rf fresnel

LABEL maintainer="mspells@umich.edu"