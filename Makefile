.PHONY: init build fmt validate help

# Default target
all: help

## Initialize Packer plugins
init:
	packer init images/

## Format HCL files
fmt:
	packer fmt -recursive .

## Validate configuration
validate:
	packer validate -var-file=talos.pkrvars.hcl images/

## Build images (requires HCLOUD_TOKEN env var)
build:
	packer build  -parallel-builds=2 -var-file=talos.pkrvars.hcl images/

## Build images in parallel (default)
build-parallel: build

## Build images sequentially (useful for debugging)
build-serial:
	packer build -parallel-builds=1 -var-file=talos.pkrvars.hcl images/

## Show help
help:
	@echo "Available targets:"
	@echo "  make init          - Initialize Packer plugins"
	@echo "  make fmt           - Format HCL files"
	@echo "  make validate      - Validate configuration"
	@echo "  make build         - Build images (parallel)"
	@echo "  make build-serial  - Build images one by one"

