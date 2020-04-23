# Overview

This repository contains docker recipes to build
[plato](https://plato-draw.readthedocs.io) images for testing and
analysis.

## CI builds: `plato-core` and `plato-tests`

These images are used to run the plato tests on
[CircleCI](https://circleci.com). They contain a subset of the
prerequisites required to run the major plato backends.

## Live analysis build: `plato-live`

This image is intended to make it easier to have working jupyter
notebook and live desktop integration for analysis and visualization
on personal systems. See more details about what is included and how
to invoke the containers in the [plato-live
README](plato-live/README.md).
