IMAGE = docker-kelda
VERSION ?= 0.1.1

.PHONY: build
build:
	docker build . -t $(IMAGE):$(VERSION)

.PHONY: run-shell
run-shell:
	@docker run --rm -ti \
		-e K8S_SERVER='' \
		-e K8S_CA_DATA='' \
		-e KELDA_USER_TOKEN='' \
		-e KELDA_NAMESPACE=$(shell whoami) \
		$(IMAGE):$(VERSION)

.PHONY: push
push: build
	@docker tag $(IMAGE):$(VERSION) cricketeerone/$(IMAGE):$(VERSION)
	@docker tag $(IMAGE):$(VERSION) cricketeerone/$(IMAGE):latest
	@docker push cricketeerone/$(IMAGE):$(VERSION)
	@docker push cricketeerone/$(IMAGE):latest
