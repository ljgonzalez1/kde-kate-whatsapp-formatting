SHELL := /usr/bin/env bash

.PHONY: all install uninstall validate help

all: validate

install:
	@./scripts/install.sh

uninstall:
	@./scripts/uninstall.sh

validate:
	@./scripts/validate.sh

help:
	@echo "Available targets:"
	@echo "  make install    Install the WhatsApp syntax definition"
	@echo "  make uninstall  Remove the installed syntax definition"
	@echo "  make validate   Validate the project and syntax definition"
	@echo "  make             Same as 'make validate'"
