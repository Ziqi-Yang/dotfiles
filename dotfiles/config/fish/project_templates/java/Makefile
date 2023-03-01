# Makefile for c/c++ program
#
# ========================================
# @author: Ziqi Yang<mr.ziqiyang@gmail.com>
# @reference: https://makefiletutorial.com/#makefile-cookbook
# ========================================

SRC_DIR := src
LIBS_DIR := libs
BUILD_DIR := target
ENTRY_POINT := Main
ENTRY_FILE := $(SRC_DIR)/Main.java
LIBS := $(shell find $(LIBS_DIR) -name "*.jar" | paste -sd ":" -)
ARGS := 

.PHONY: build run
build:
	mkdir -p $(BUILD_DIR)
	javac -d $(BUILD_DIR) -cp .:$(LIBS) -sourcepath $(SRC_DIR) $(ENTRY_FILE)

run:
	java -cp $(BUILD_DIR):$(LIBS) $(ENTRY_FILE) $(ARGS)
