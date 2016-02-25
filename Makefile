MAKEFILE_VERSION=1

DEST=./dist
OUTPUT=$(DEST)/interview
OUTPUT_QUESTIONS=$(OUTPUT)/questions
TARGET=./questions/*.md 
EXT_LICENSE=./_license
EXT_CONFIG=./_config
EXT_CONFIG_FILES=$(EXT_CONFIG)/*.json


default: main
	-@echo "=================="
	-@echo "  Build Success!  "
	-@echo "=================="

pre-build:
	mkdir -p $(OUTPUT)
	
	# create book.json
	gitbook-ext jsonmerge $(EXT_CONFIG_FILES) > $(OUTPUT)/interview.json

build:
	emanual-interview jsonify --output $(OUTPUT_QUESTIONS) $(TARGET)
	
post-build:
	cp -rf $(EXT_LICENSE) $(OUTPUT)

package:
	cd $(DEST) && zip -vr interview.zip interview/ 

main: pre-build build post-build package

.PHONY: default main pre-build build post-build package
