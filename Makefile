OUTPUT=./dist
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

package:
	cd $(OUTPUT) && zip -vr questions.zip questions/ 

main: pre-build build package

.PHONY: pre-build build main
