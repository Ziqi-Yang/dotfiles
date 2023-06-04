# Makefile for java program
#
# ========================================
# @author: Ziqi Yang<mr.ziqiyang@gmail.com>
# @reference: https://makefiletutorial.com/#makefile-cookbook
# ========================================
# .
# ├── lib
# │   └── junit-platform-console-standalone-1.9.2.jar
# ├── Makefile
# ├── README.org
# └── src
#     ├── main
#     │   └── java
#     │       └── app
#     │           └── Main.java
#     └── test
#         └── java
#             └── app
#                 └── MainTest.java

SRC_DIR := src
PKG_NAME := app
# Note that jdtls will automatically compile files under `src` directory along with all jar libraries
# under `lib` directory to `/tmp/jdtls-*` directory. To add new libraries in one session, one should
# delete the cache directory and restart the jdtls language server.
# the default lib directory value comes from: https://github.com/eclipse/eclipse.jdt.ls/blob/9c97b34230e7e743d26b9e0b995e1e1310c2d431/org.eclipse.jdt.ls.core/src/org/eclipse/jdt/ls/core/internal/managers/InvisibleProjectBuildSupport.java#L41
LIBS_DIR := lib
DOC_DIR := api_doc
RESOURCES_DIR := resources
BUILD_DIR := target
SOURCE_FILES := $(shell find $(SRC_DIR) -name "*.java")
ENTRY_FILE := $(SRC_DIR)/main/java/$(PKG_NAME)/Main.java
LIBS := $(shell find $(LIBS_DIR) -name "*.jar" | paste -sd ":" -)
ARGS := 

.PHONY: build run test doc clean jdtls_clean gen_tags
build:
	@echo building...
	@mkdir -p $(BUILD_DIR)
	@javac -d $(BUILD_DIR) -cp .:$(LIBS) -sourcepath $(SRC_DIR) $(SOURCE_FILES)

run: build
	java -cp $(BUILD_DIR):$(RESOURCES_DIR):$(LIBS) $(ENTRY_FILE) $(ARGS)

test: build
	java -jar $(LIBS_DIR)/junit-platform-console-standalone-1.9.2.jar --class-path $(BUILD_DIR) --scan-class-path

# single test
# java -jar $(LIBS_DIR)/junit-platform-console-standalone-1.9.2.jar --class-path $(BUILD_DIR) --select-method app.MainTest#simpleTest

doc:
	javadoc -d $(DOC_DIR) -cp $(LIBS) -sourcepath $(SRC_DIR)/main/java -subpackages $(PKG_NAME)

clean:
	rm -rf $(BUILD_DIR) $(DOC_DIR)

jdtls_clean:
	rm -rf /tmp/jdtls*

gen_tags:
	etags.emacs $$(find $(SRC_DIR) -type f -name "*.java")
