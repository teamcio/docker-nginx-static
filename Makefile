IMAGE_NAME = teamc.io/docker/static
VERSION = latest
CI_REGISTRY = rg.teamc.io

default:
	make build && make run

build:
	docker build \
      --build-arg VERSION=$(VERSION) \
      --build-arg BUILD_DATE=$$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
      --build-arg VCS_REF=$$(git rev-parse --short HEAD) \
      -t $(CI_REGISTRY)/$(IMAGE_NAME):$(VERSION) .

push:
	docker push $(CI_REGISTRY)/$(IMAGE_NAME):$(VERSION)

run:
	docker run --rm -it -p 8080:8080 $(CI_REGISTRY)/$(IMAGE_NAME):$(VERSION)