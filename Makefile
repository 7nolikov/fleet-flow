# AutoRent Fleet Flow - Makefile
# Usage: make <target>

.PHONY: help install dev build clean new-car serve preview test lint

# Default target
help:
	@echo "AutoRent Fleet Flow - Available Commands"
	@echo "========================================="
	@echo "  make install    - Install npm dependencies"
	@echo "  make dev        - Start development server with drafts"
	@echo "  make serve      - Start development server (no drafts)"
	@echo "  make build      - Build production site"
	@echo "  make preview    - Build and preview production site"
	@echo "  make clean      - Remove generated files"
	@echo "  make new-car    - Create new car entry (usage: make new-car name=car-name)"
	@echo "  make mod-init   - Initialize Hugo modules"
	@echo "  make mod-update - Update Hugo modules"

# Install dependencies
install:
	npm install
	hugo mod get -u

# Development server with drafts enabled
dev:
	hugo server -D --bind 0.0.0.0 --port 1313

# Development server without drafts
serve:
	hugo server --bind 0.0.0.0 --port 1313

# Build for production
build:
	hugo --minify --gc

# Preview production build
preview:
	hugo server --minify --bind 0.0.0.0 --port 1313

# Clean generated files (PowerShell compatible)
clean:
	@if exist public rmdir /s /q public
	@if exist resources rmdir /s /q resources
	@if exist .hugo_build.lock del .hugo_build.lock
	@echo Cleaned generated files.

# Clean generated files (Unix/Linux/macOS)
clean-unix:
	rm -rf public resources .hugo_build.lock

# Create new car entry
# Usage: make new-car name=toyota-camry-2024
new-car:
ifndef name
	@echo "Usage: make new-car name=car-slug"
	@echo "Example: make new-car name=toyota-camry-2024"
else
	hugo new cars/$(name).md
	@echo "Created: content/cars/$(name).md"
endif

# Initialize Hugo modules
mod-init:
	hugo mod init github.com/dmitrii-novikov/fleet-flow
	hugo mod get

# Update Hugo modules
mod-update:
	hugo mod get -u
	hugo mod tidy

# Verify Hugo installation
check:
	@echo "Hugo version:"
	@hugo version
	@echo ""
	@echo "Node version:"
	@node --version
	@echo ""
	@echo "npm version:"
	@npm --version

# Run linter (if using a linter)
lint:
	@echo "No linter configured yet."

