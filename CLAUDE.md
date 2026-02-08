# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal notes/documentation site built with MkDocs and the Material theme. Markdown files in `docs/` are compiled into a static HTML site deployed to GitHub Pages via CI on every push to `main`.

## Commands

```bash
make install   # Install mkdocs-material into .venv
make serve     # Start local dev server with hot reload
make build     # Build static site to ./site/
make clean     # Remove .venv and site/
```

First-time setup: run `./setup.sh` or `make venv && make install`.

## Architecture

- `docs/` — All content as Markdown files, organized by category (books, courses, devops, projects, tech-docs)
- `docs/assets/` — Images, custom CSS (`extra.css`), and MathJax config (`mathjax.js`)
- `mkdocs.yml` — Site configuration: theme settings, markdown extensions, custom CSS/JS
- `Makefile` — Build automation wrapping mkdocs commands
- `.github/workflows/deploy.yml` — CI/CD: builds with `make install && make build`, deploys `site/` to GitHub Pages

## MkDocs Configuration Notes

- Material theme with light/dark mode toggle
- Math rendering via MathJax (inline `\(...\)` and display `\[...\]`)
- Code syntax highlighting with copy buttons enabled (`pymdownx.highlight`, `pymdownx.superfences`)
- Custom serif font and color scheme defined in `docs/assets/extra.css`
