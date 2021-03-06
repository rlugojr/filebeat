#!/bin/bash

BEATNAME=filebeat
SYSTEM_TESTS=true
TEST_ENVIRONMENT=false

include scripts/Makefile

# This is called by the beats-packer to obtain the configuration file and
# default template
.PHONY: install-cfg
install-cfg:
	cp etc/filebeat.template.json $(PREFIX)/filebeat.template.json
	# linux
	cp etc/filebeat.yml $(PREFIX)/filebeat-linux.yml
	sed -i 's@#registry_file: .filebeat@registry_file: /var/lib/filebeat/registry@' $(PREFIX)/filebeat-linux.yml
	# binary
	cp etc/filebeat.yml $(PREFIX)/filebeat-binary.yml
	# darwin
	cp etc/filebeat.yml $(PREFIX)/filebeat-darwin.yml
	# win
	cp etc/filebeat.yml $(PREFIX)/filebeat-win.yml
	sed -i 's@#registry_file: .filebeat@registry_file: "C:/ProgramData/filebeat/registry"@' $(PREFIX)/filebeat-win.yml
