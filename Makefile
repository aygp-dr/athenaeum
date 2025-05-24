.PHONY: help setup serve clean build deploy status

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

setup: ## Install dependencies for local development
	@echo "Setting up GitHub Pages development environment..."
	@if command -v bundle >/dev/null 2>&1; then \
		bundle install; \
	else \
		echo "Ruby bundler not found. Please install Ruby and bundler first."; \
	fi

serve: ## Serve the site locally for development
	@echo "Starting local development server..."
	@if command -v bundle >/dev/null 2>&1; then \
		bundle exec jekyll serve --livereload; \
	else \
		echo "Please run 'make setup' first to install dependencies."; \
	fi

build: ## Build the site for production
	@echo "Building site for production..."
	@if command -v bundle >/dev/null 2>&1; then \
		bundle exec jekyll build; \
	else \
		echo "Please run 'make setup' first to install dependencies."; \
	fi

clean: ## Clean build artifacts
	@echo "Cleaning build artifacts..."
	@rm -rf _site .jekyll-cache .jekyll-metadata

deploy: build ## Deploy to GitHub Pages (triggers via git push)
	@echo "Deploying to GitHub Pages..."
	@git add .
	@git status
	@echo "Commit and push changes to deploy to GitHub Pages"

status: ## Check GitHub Pages deployment status
	@echo "Checking repository status..."
	@git status
	@echo ""
	@echo "To check GitHub Pages deployment status, visit:"
	@echo "https://github.com/$$(git config --get remote.origin.url  < /dev/null |  sed 's/.*github.com[:/]\([^.]*\).*/\1/')/deployments"

docs: ## Generate/update documentation
	@echo "Documentation commands:"
	@echo "  README.md - Main project documentation"
	@echo "  CLAUDE.org - Project preferences (preferred format)"
	@echo "Use 'make help' to see all available commands"
