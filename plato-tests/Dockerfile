FROM mspells/plato-core

ENV fresnel_ver=fresnel-v0.13.2

RUN pip3 install pyglet vispy pythreejs jupyter nose && \
    jupyter nbextension enable --py --sys-prefix widgetsnbextension && \
    jupyter nbextension enable --py --sys-prefix vispy && \
    jupyter nbextension install --sys-prefix --py pythreejs && \
    jupyter nbextension enable --sys-prefix --py pythreejs && \
    wget https://glotzerlab.engin.umich.edu/Downloads/fresnel/${fresnel_ver}.tar.gz && \
    tar xf ${fresnel_ver}.tar.gz && \
    mkdir ${fresnel_ver}/build && \
    cd ${fresnel_ver}/build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=$(python3 -c 'import sys;print([s for s in sys.path if "packages" in s][0])') && \
    make -j$(nproc) install && \
    cd / && \
    rm -rf ${fresnel_ver} ${fresnel_ver}.tar.gz

LABEL maintainer="mspells@umich.edu" \
    org.opencontainers.image.authors="Matthew Spellings <mspells@umich.edu>" \
    org.opencontainers.image.description="Infrastructure to run plato unit tests on CircleCI." \
    org.opencontainers.image.documentation="https://github.com/glotzerlab/plato-containers" \
    org.opencontainers.image.source="https://github.com/glotzerlab/plato-containers" \
    org.opencontainers.image.title="Plato-tests" \
    org.opencontainers.image.url="https://github.com/glotzerlab/plato-containers"
