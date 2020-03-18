IMAGE = kelda-cli
VERSION ?= 0.1.0

.PHONY: build
build:
	docker build . -t $(IMAGE):$(VERSION)

.PHONY: run-shell
run-shell:
	@docker run --rm -ti \
		-e K8S_SERVER='' \
		-e K8S_CA_DATA='' \
		-e KELDA_USER_TOKEN='' \
		$(IMAGE):$(VERSION)
