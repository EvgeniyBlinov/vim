# vim: set noet ci pi sts=0 sw=4 ts=4 :
# http://www.gnu.org/software/make/manual/make.html
# http://linuxlib.ru/prog/make_379_manual.html
SHELL:=/bin/bash
CURRENT_DIR := $(shell dirname "$(realpath "$(lastword $(MAKEFILE_LIST))")")
########################################################################
-include .env
export
########################################################################
PACK_ENV ?= common
PACK_ACTION ?= start
PACK_PATH ?= pack/$(PACK_ENV)/$(PACK_ACTION)

$(PACK_PATH):
	mkdir -p $@

.PHONY: _plugin-common
_plugin-common: $(PACK_PATH)

.PHONY: plugin-add
plugin-add: \
		_plugin-common
	if [ ! -d "$(PACK_PATH)/$(notdir ${ARGS})" ]; then \
		git submodule add \
			${ARGS} \
			$(PACK_PATH)/$(notdir ${ARGS}) ;\
	else \
		echo "Plugin $(PACK_PATH)/$(notdir ${ARGS}) already exists!" ;\
	fi

.PHONY: plugin-upgrade-all
plugin-upgrade-all:
	git submodule update --remote --merge
	git commit
