FROM mspells/plato-core
MAINTAINER Matthew Spellings <mspells@umich.edu>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  povray \
  python3-nose \
  python3-pip \
  python3-numpy \
  python3-scipy \
  python3-matplotlib \
  python3-opengl && \
  apt-get -y clean

COPY run_plato_tests.sh /

ENV APP "/run_plato_tests.sh"
