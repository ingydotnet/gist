M := .cache/makes
$(shell [ -d $M ] || ( git clone -q https://github.com/makeplus/makes $M))

VERSION := 0.1.1
FILE := gist

include $M/init.mk
include $M/ys.mk
include $M/gloat.mk
include $M/clean.mk
include $M/shell.mk
include $M/agents.mk

ifdef PREFIX
ifneq ($(filter /%,$(PREFIX)),$(PREFIX))
$(error PREFIX must be an absolute path)
endif
endif

BIN := $(PREFIX)/bin


release: gloat-github-release

install:
ifndef PREFIX
	@echo "'make install' requires PREFIX."
	@exit 1
endif
ifeq (,$(wildcard $(BIN)))
	@echo "Invalid PREFIX. No directory '$(BIN)'."
	@exit 1
endif
ifeq (,$(wildcard $(BIN)/ys))
	curl -sL https://yamlscript.org/install | \
	  BIN=1 PREFIX=$(PREFIX) bash
endif
	cp gist $(BIN)/
