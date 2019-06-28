FROM mspells/plato-core

ENV fresnel_ver=fresnel-v0.9.0

RUN pip3 install pyglet git+https://github.com/vispy/vispy pythreejs jupyter nose && \
    jupyter nbextension enable --py widgetsnbextension && \
    jupyter nbextension install --sys-prefix --py pythreejs && \
    jupyter nbextension enable --sys-prefix --py pythreejs && \
    wget https://glotzerlab.engin.umich.edu/Downloads/fresnel/${fresnel_ver}.tar.gz && \
    tar xf ${fresnel_ver}.tar.gz && \
    mkdir ${fresnel_ver}/build && \
    cd ${fresnel_ver}/build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local/lib/python3.5/dist-packages && \
    make install && \
    cd / && \
    rm -rf ${fresnel_ver} ${fresnel_ver}.tar.gz

LABEL maintainer="mspells@umich.edu"