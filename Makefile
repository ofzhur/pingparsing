.PHONY: build
build:
	@make clean
	@tox -e build
	ls -lh dist/*

.PHONY: check
check:
	@-tox -e lint
	travis lint

.PHONY: clean
clean:
	@tox -e clean

.PHONY: docs
docs:
	@cd docs && ./update_command_help.py
	@tox -e docs

.PHONY: idocs
idocs:
	@pip install --upgrade .
	@make docs

.PHONY: fmt
fmt:
	@tox -e fmt

.PHONY: readme
readme:
	@cd docs && ./update_command_help.py
	@tox -e readme

.PHONY: release
release:
	@tox -e release
	@make clean

.PHONY: setup
setup:
	@pip install --upgrade -e .[test] tox
