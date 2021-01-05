BUILD_URL ?= $(shell pwd)
BUILD_DATE ?= $(shell date --rfc-3339=ns)
GIT_URL := $(shell git config --get remote.origin.url)
GIT_COMMIT := $(shell git rev-parse HEAD)
PY_VER := $(shell head -n1 Dockerfile|cut -d":" -f2|cut -d"-" -f1)

all: latest push

latest:
	@echo "Building base-python-builder $(PY_VER)"
	docker build \
		-t evryfs/base-python-builder:latest \
		-t evryfs/base-python-builder:3 \
		-t evryfs/base-python-builder:$(PY_VER) \
		-t quay.io/evryfs/base-python-builder:latest \
		-t quay.io/evryfs/base-python-builder:3 \
		-t quay.io/evryfs/base-python-builder:$(PY_VER) \
		--build-arg PY_VER="$(PY_VER)" \
		--build-arg BUILD_DATE="$(BUILD_DATE)" \
		--build-arg BUILD_URL="$(BUILD_URL)" \
		--build-arg GIT_URL="$(GIT_URL)" \
		--build-arg GIT_COMMIT="$(GIT_COMMIT)" \
		-f Dockerfile .

push:
	docker push quay.io/evryfs/base-python-builder:3
	docker push quay.io/evryfs/base-python-builder:latest
	docker push quay.io/evryfs/base-python-builder:$(PY_VER)


