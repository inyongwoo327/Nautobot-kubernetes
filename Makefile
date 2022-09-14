
# Get current branch by default
tag := $(shell git rev-parse --abbrev-ref HEAD)
values := "./kubernetes/values.yaml"

build:
	docker build -t ghcr.io/networktocode/nautobot-kubernetes:$(tag) .

push:
	docker push ghcr.io/networktocode/nautobot-kubernetes:$(tag)

pull:
	docker pull ghcr.io/networktocode/nautobot-kubernetes:$(tag)

lint:
	@echo "Linting..."
	@sleep 1
	@echo "Done."

test:
	@echo "Testing..."
	@sleep 1
	@echo "Done."

update-tag:
	sed -i '' 's/tag: \".*\"/tag: \"$(tag)\"/g' $(values)
