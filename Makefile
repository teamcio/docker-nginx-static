IMAGE_NAME = teamcio/docker-nginx-static
VERSION = latest

default:
	make build && make run

build:
	docker build \
      --build-arg VERSION=$(VERSION) \
      --build-arg BUILD_DATE=$$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
      --build-arg VCS_REF=$$(git rev-parse --short HEAD) \
      -t $(IMAGE_NAME):$(VERSION) .

push:
	docker push $(IMAGE_NAME):$(VERSION)

run:
	docker run --rm -it -p 8080:8080 $(IMAGE_NAME):$(VERSION)