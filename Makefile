# Compiler
CC := g++

# Compiler flags
CFLAGS := -Wall -Wextra

# Include directories
INCLUDES := -IC:\glfw-3.4\include -IC:\VulkanSDK\1.3.290.0\Include -IC:\glm_parent

# Library directories
LIBS := -LC:\glfw-3.4\lib-mingw-w64 -LC:\VulkanSDK\1.3.290.0\Lib

# Libraries
LDFLAGS := -lglfw3 -lvulkan-1 -lgdi32

# Combine flags
CFLAGS += $(INCLUDES) $(LIBS) $(LDFLAGS)

# Source files
SRCS := $(wildcard src/*.cpp)

# Object files
OBJS := $(SRCS:.cpp=.o)

# Executable name
TARGET := vulkan-learn

# Default target
all: $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CC) -c $< -o $@ $(CFLAGS) 

# Link object files into executable
$(TARGET): $(OBJS)
	$(CC) $^ -o $@ $(CFLAGS)

# Clean up object files and executable
clean:
	rm -f $(OBJS) $(TARGET)