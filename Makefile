.PHONY: help venv install build serve clean
.DEFAULT_GOAL := help

VENV_DIR = .venv

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  venv      Create virtual environment"
	@echo "  install   install dependencies"
	@echo "  build     Build the site with mkdocs"
	@echo "  serve     Start local development server"
	@echo "  clean     Remove venv and build output"

venv:
	@python3 -m venv $(VENV_DIR)
	@echo "activate with:"
	@echo "  source .venv/bin/activate"

install:
	pip install mkdocs-material

build:
	mkdocs build

serve:
	mkdocs serve

clean:
	rm -rf $(VENV_DIR) site
