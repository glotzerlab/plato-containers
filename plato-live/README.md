# Introduction

This image includes a working installation of
[plato](https://plato-draw.readthedocs.io) and its dependencies,
usable for desktop applications (via `pyside2`) and in jupyter
notebooks.

## Desktop view: `novnc`

The `novnc` script creates a virtual desktop view and exposes it via
[turbovnc](https://www.turbovnc.org) and
[novnc](https://novnc.com). Port 5900 can be accessed within the image
to connect to the VNC server directly (i.e. with a VNC viewer on the
host), or port 5400 can be accessed through a web browser to use a
lightweight web-based VNC viewer.

The script can accept a command to run within the visual environment,
although no suitable demo programs are included in this base image.

```
# Run VNC server to access it on port 5900 in the host using
# a standalone VNC client
docker run -p 5900:5900 --rm mspells:plato-live:latest novnc
# Use noVNC on port 5400 and expose the host working directory in ~/work
docker run -p 5400:5400 --rm --mount type=bind,dst=/home/user/work,src="$(pwd)" mspells:plato-live:latest novnc
```

## Notebook server: `notebook`

The `notebook` script runs a typical jupyter notebook with vispy
integration set up. It can be accessed within the image on port 8888.

```
# Run the notebook server, exposing the host current working directory in ~/work
docker run -p 8888:8888 --rm --mount type=bind,dst=/home/user/work,src="$(pwd)" mspells:plato-live:latest notebook
```