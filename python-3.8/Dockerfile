FROM quay.io/evryfs/base-python:3.8
ARG BUILD_DATE
ARG BUILD_URL
ARG GIT_URL
ARG GIT_COMMIT
ARG PYTHON_VERSION
LABEL maintainer="Kristian Berg <kristian.berg@evry.com>" \
      org.opencontainers.image.title="base-python-builder" \
      org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.authors="Kristian Berg <kristian.berg@evry.com>" \
      org.opencontainers.image.url=$BUILD_URL \
      org.opencontainers.image.documentation="https://github.com/evryfs/base-python-builder/" \
      org.opencontainers.image.source=$GIT_URL \
      org.opencontainers.image.version=$PYTHON_VERSION \
      org.opencontainers.image.revision=$GIT_COMMIT \
      org.opencontainers.image.vendor="EVRY Financial Services" \
      org.opencontainers.image.licenses="proprietary-license" \
      org.opencontainers.image.description="Base image for building python 3.8 images using docker"

ENV PIP_INDEX https://pypi.org/pypi
ENV PIP_INDEX_URL https://pypi.org/simple
USER root
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends docker.io docker-compose
RUN rm -rf /var/lib/apt/lists/*
RUN pip install poetry black
CMD ["/bin/bash"]
