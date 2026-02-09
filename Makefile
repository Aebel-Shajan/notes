.PHONY: help venv install build serve clean quiz
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
	@echo "  quiz      Generate a quiz (DOC=<topic> LENGTH=<n>)"

venv:
	@python3 -m venv $(VENV_DIR)
	@echo "activate with:"
	@echo "  source .venv/bin/activate"

install:
	@pip install mkdocs-material mkdocs-quiz

build:
	mkdocs build

serve:
	mkdocs serve

clean:
	rm -rf $(VENV_DIR) site

quiz:
ifndef DOC
	$(error Usage: make quiz DOC=<topic> [LENGTH=<number>])
endif
	claude -p "/quiz $(DOC) $(LENGTH) --allowedTools Write Edit"
