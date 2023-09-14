# Makefile for c/c++ program
#
# ========================================
# @author: Ziqi Yang<mr.ziqiyang@gmail.com>
# @create_date: Tue Jan 17 2023
# @last_modified_date: <2023-09-05 Tue 16:27>
# @reference: https://makefiletutorial.com/#makefile-cookbook
# ========================================
TARGET_EXEC := main

SRC_DIR := ./src
BUILD_DIR := ./build
DEBUG_DIR := $(BUILD_DIR)/debug
RELEASE_DIR := $(BUILD_DIR)/release

# CC := cc # default: cc
# CXX := g++ # default: g++

SRCS := $(shell fd '.*\.(c|cpp|s)' $(SRC_DIR))
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)
INC_DIRS := $(fd --type d '.' $(SRC_DIR))
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

# CPPFLAGS: c/c++ shared flags
CPPFLAGS := $(INC_FLAGS) -march=native -Wall -Wextra -pedantic -MMD -MP
CFGLAGS := -std=c11 # only for c
# CXXFGLAGS := # only for cpp
CPP_FLAGS_DEBUG := -O0 -g3 -Werror -Wshadow
CPP_FLAGS_RELEASE := -O2

LDLIBS := -lm
# LDFLAGS : =-L/usr/local/include

.PHNOY: debug release clean run runRelease
# default: debug
debug: CPPFLAGS += $(CPP_FLAGS_DEBUG)
debug: $(DEBUG_DIR)/$(TARGET_EXEC)

release: CPPFLAGS += $(CPP_FLAGS_RELEASE)
release: $(RELEASE_DIR)/$(TARGET_EXEC)

$(DEBUG_DIR)/$(TARGET_EXEC): $(OBJS)
	mkdir -p $(DEBUG_DIR)
	$(CXX) $(OBJS) -o $@ $(LDLIBS) $(LDFLAGS)

$(RELEASE_DIR)/$(TARGET_EXEC): $(OBJS)
	mkdir -p $(RELEASE_DIR)
	$(CXX) $(OBJS) -o $@ $(LDLIBS) $(LDFLAGS)

# Build step for C source
$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# Build step for C++ source
$(BUILD_DIR)/%.cpp.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

clean:
	rm -r $(BUILD_DIR)

# run debug target
# make run ARGS="arg1 arg2"
run: debug # must use label, since in debug label, we update $CPPFLAGS
	$(DEBUG_DIR)/$(TARGET_EXEC) $(ARGS) 

# make runRelease ARGS="arg1 arg2"
runRelease: release
	$(RELEASE_DIR)/$(TARGET_EXEC) $(ARGS)

# make runDebug ARGS="arg1"
runDebug: debug
	 cgdb $(DEBUG_DIR)/$(TARGET_EXEC) $(ARGS)

-include $(DEPS)
