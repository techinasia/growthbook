PROJECT = growthbook.techinasia.com
NAME = 314303761830.dkr.ecr.ap-southeast-1.amazonaws.com/$(PROJECT)
VERSION = v2.3.0

.PHONY: build build-nocache tag-latest push push-latest release git-tag-version

build:
	docker build -f Dockerfile -t $(NAME):$(VERSION) --rm --platform=linux/amd64 .

push:
	docker push $(NAME):$(VERSION)

tag-latest:
	docker tag $(NAME):$(VERSION) $(NAME):latest

push:
	docker push $(NAME):$(VERSION)

push-latest:
	docker push $(NAME):latest

release: build tag-latest push push-latest

git-tag-version: release
	git tag -a v$(VERSION) -m "v$(VERSION)"
