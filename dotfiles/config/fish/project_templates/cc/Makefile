##
# C Makefile
# reference: https://makefiletutorial.com/#makefile-cookbook
# important gcc flags: https://www.linuxfordevices.com/tutorials/linux/important-gcc-flags
#
# @file
# @version 0.1

TARGET_EXEC := main


BUILD_DIR := ./build
SRC_DIR := ./src

SRCS := $(shell fd '.*\.(c|cpp|s)' $(SRC_DIR))
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)
INC_DIRS := $(fd --type d '.' $(SRC_DIR))
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

all: run

CPPFLAGS := $(INC_FLAGS) -Wall -MMD -MP
# CFGLAGS :=
# CXXFGLAGS :=
LDLIBS := -lraylib -lGL -lm -lpthread -ldl -lrt
# LDFLAGS : =-L/usr/local/include

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LDLIBS) $(LDFLAGS)

# Build step for C source
$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# Build step for C++ source
$(BUILD_DIR)/%.cpp.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

.PHNOY: clean run build
build: $(BUILD_DIR)/$(TARGET_EXEC)

run: build
	$(BUILD_DIR)/$(TARGET_EXEC)

clean:
	rm -r $(BUILD_DIR)


-include $(DEPS)
# end
