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
        libxkbcommon-x11-0 \
        openbox \
        pkg-config \
        povray \
        python3-dev \
        python3-numpy \
        python3-pybind11 \
        python3-scipy \
        python3-matplotlib \
        python3-venv \
        tint2 \
        websockify \
        wget \
        x11-xkb-utils \
        xterm \
        && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm -rf get-pip.py && \
    apt-get -y clean

ENV embree_ver=3.2.3
RUN wget https://github.com/embree/embree/archive/v${embree_ver}.tar.gz && \
    tar xf v${embree_ver}.tar.gz && \
    mkdir embree-${embree_ver}/build && \
    cd embree-${embree_ver}/build && \
    cmake .. -DEMBREE_ISPC_SUPPORT=off -DEMBREE_TUTORIALS=off -DCMAKE_INSTALL_PREFIX=/usr && \
    make -j$(nproc) install && \
    cd ../.. && \
    rm -rf embree-${embree_ver} v${embree_ver}.tar.gz
ENV fresnel_ver=fresnel-v0.12.0
RUN wget https://glotzerlab.engin.umich.edu/Downloads/fresnel/${fresnel_ver}.tar.gz && \
    tar xf ${fresnel_ver}.tar.gz && \
    mkdir ${fresnel_ver}/build && \
    cd ${fresnel_ver}/build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=$(python3 -c 'import sys;print([s for s in sys.path if "packages" in s][0])') && \
    make -j$(nproc) install && \
    cd / && \
    rm -rf ${fresnel_ver} ${fresnel_ver}.tar.gz

ENV turbovnc_ver=2.2.4
RUN wget "https://sourceforge.net/projects/turbovnc/files/${turbovnc_ver}/turbovnc_${turbovnc_ver}_amd64.deb/download" -O turbovnc.deb && \
  dpkg -i turbovnc.deb && \
  rm turbovnc.deb
RUN git clone https://github.com/kanaka/noVNC.git /opt/noVNC && \
  cd /opt/noVNC && \
  git checkout v1.1.0 && \
  ln -s vnc.html index.html
COPY xstartup /etc/skel/.xstartup
COPY novnc /usr/bin/
EXPOSE 5900 5400

COPY notebook /usr/bin/
EXPOSE 8888

COPY Xdefaults /etc/skel/.Xdefaults

RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user
ENV venv=/home/user/env
ENV PATH="${venv}/bin:$PATH"
RUN python3 -m venv --system-site-packages ${venv}

RUN python -m pip install --no-cache-dir \
        jupyter \
        vispy \
        plato-draw==1.11.0 \
        pyglet \
        pyopengl \
        pythreejs \
        pyside2 \
        qt.py \
        && \
    jupyter nbextension enable --py --sys-prefix widgetsnbextension && \
    jupyter nbextension enable --py --sys-prefix vispy && \
    jupyter nbextension install --sys-prefix --py pythreejs && \
    jupyter nbextension enable --sys-prefix --py pythreejs

RUN mkdir -p ~/work
WORKDIR work

RUN git clone https://github.com/glotzerlab/plato-gallery

LABEL maintainer="mspells@umich.edu" \
    org.opencontainers.image.authors="Matthew Spellings <mspells@umich.edu>" \
    org.opencontainers.image.description="Prerequisites to run live analysis and visualization using plato." \
    org.opencontainers.image.documentation="https://github.com/glotzerlab/plato-containers" \
    org.opencontainers.image.source="https://github.com/glotzerlab/plato-containers" \
    org.opencontainers.image.title="Plato-live" \
    org.opencontainers.image.url="https://github.com/glotzerlab/plato-containers"
