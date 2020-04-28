FROM quay.io/evryfs/base-python:3.6
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
      org.opencontainers.image.description="Base image for building python 3.6 images using docker"

ENV PIP_INDEX https://pypi.org/pypi
ENV PIP_INDEX_URL https://pypi.org/simple
USER root
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends docker.io docker-compose make git && \
    rm -rf /var/lib/apt/lists/*
RUN pip install poetry black virtualenv flake8 bandit pytest nose
RUN groupadd -g 1005 jenkins
RUN useradd -r -s /bin/bash -c "jenkins user" -d /jenkins -u 1005 -g 1005 -G docker -m jenkins
RUN mkdir /.config /.cache
RUN chmod 777 /.config /.cache
WORKDIR /app
USER 1005:1005
COPY flake8-black.ini /jenkins/.flake8
CMD ["/bin/bash"]
