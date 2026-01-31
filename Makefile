.PHONY: help venv install build serve clean
.DEFAULT_GOAL := help

VENV_DIR = .venv
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip
MKDOCS = $(VENV_DIR)/bin/mkdocs

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  venv      Create virtual environment"
	@echo "  install   Create venv and install dependencies"
	@echo "  build     Build the site with mkdocs"
	@echo "  serve     Start local development server"
	@echo "  clean     Remove venv and build output"

venv:
	python3 -m venv $(VENV_DIR)

install:
	@test -d $(VENV_DIR) || (echo "Error: venv not found. Run 'make venv' first." && exit 1)
	$(PIP) install mkdocs-material

build:
	@test -d $(VENV_DIR) || (echo "Error: venv not found. Run 'make venv' first." && exit 1)
	@test -x $(MKDOCS) || (echo "Error: mkdocs not installed. Run 'make install' first." && exit 1)
	$(MKDOCS) build

serve:
	@test -d $(VENV_DIR) || (echo "Error: venv not found. Run 'make venv' first." && exit 1)
	@test -x $(MKDOCS) || (echo "Error: mkdocs not installed. Run 'make install' first." && exit 1)
	$(MKDOCS) serve

clean:
	rm -rf $(VENV_DIR) site
