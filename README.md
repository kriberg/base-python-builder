# EVRY FS python builder image
[![Docker Repository on Quay](https://quay.io/repository/evryfs/base-python-builder/status "Docker Repository on Quay")](https://quay.io/repository/evryfs/base-python-builder)

This image is used to build python packages and new container images within the pipeline.

## Usage

To execute your pipeline within this image, add this to your `Jenkinsfile`:

```
pipeline {
  agent {
    label 'docker'
    docker {
      image 'evryfs/base-python-builder:3.6'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
}
```
