# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -Iinclude -Ilib/munit

# Directories
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
TEST_DIR = tests
LIB_DIR = lib

# Source and object files
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRC_FILES))
TEST_FILES = $(wildcard $(TEST_DIR)/*.c)
TEST_OBJ_FILES = $(patsubst $(TEST_DIR)/%.c, $(BUILD_DIR)/%.o, $(TEST_FILES))

# Output binary
TARGET = $(BUILD_DIR)/my_project

# Test executable
TEST_TARGET = $(BUILD_DIR)/test_runner

# Default rule: build the project
all: $(TARGET)

# Rule to build the project
$(TARGET): $(OBJ_FILES) $(LIB_DIR)/munit/munit.o | $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $@ $(OBJ_FILES)

# Rule to build the munit library
$(LIB_DIR)/munit/munit.o: $(LIB_DIR)/munit/munit.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

# Rule to create the build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Rule to build object files from source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

# Rule to run tests
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJ_FILES) $(LIB_DIR)/munit/munit.o $(BUILD_DIR)/hello.o
	$(CC) $(CFLAGS) -o $@ $^

# Rule to build object files from test files
$(BUILD_DIR)/%.o: $(TEST_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

# Run the main program
run: $(TARGET)
	./$(TARGET)

# Clean up build artifacts
clean:
	rm -rf $(BUILD_DIR)/*

.PHONY: all test run clean