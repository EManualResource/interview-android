MAKEFILE_VERSION=1

DEST=./dist
OUTPUT=$(DEST)/package
OUTPUT_QUESTIONS=$(OUTPUT)/questions
TARGET=./questions/*.md 


default: main
	-@echo "=================="
	-@echo "  Build Success!  "
	-@echo "=================="

pre-build:
	mkdir -p $(OUTPUT)

build:
	emanual-interview jsonify --output $(OUTPUT_QUESTIONS) $(TARGET)
	
post-build:
	cp -rf _license $(OUTPUT)

package:
	cd $(DEST) && zip -vr package.zip package/ 

main: pre-build build post-build package

.PHONY: default main pre-build build post-build package
