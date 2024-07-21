DOCKER ?= docker
ORG ?= leophys
IMAGE ?= $(ORG)/nvim
TAG ?= dev
NVIMHOMEDIR ?= ~/.config/nvim

.PHONY: build
build:
	$(DOCKER) build \
		--build-arg UID=$$(id -u) \
		--build-arg GID=$$(id -g) \
		-t $(IMAGE):$(TAG) .

.PHONY: dev
dev:
	$(DOCKER) run --rm \
		-v $$PWD:/home/nvim/.config/nvim \
		-v $$EXTRA:$$EXTRA \
		-ti $(IMAGE):$(TAG) \
		${TARGET}

.PHONY: dbg
dbg:
	$(DOCKER) run --rm \
		-v $$PWD:/home/vim/.vim \
		-v $$EXTRA:$$EXTRA \
		-e DEBUG=1 \
		--entrypoint /usr/bin/zsh \
		-ti $(IMAGE):$(TAG) \

.PHONY: install
install: $(NVIMHOMEDIR)

$(NVIMHOMEDIR):
	ln -s $$PWD ~/.config/nvim
