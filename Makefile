CXX = nvcc
CXXFLAGS = -std=c++17 -O3 -Wno-deprecated-gpu-targets
CUDA_LIBS = -lcudart
STBFLAGS = -DSTB_IMAGE_IMPLEMENTATION -DSTB_IMAGE_WRITE_IMPLEMENTATION

# Adjust these paths as necessary
CUDA_PATH = /usr/local/cuda
STB_PATH = ./include

# Source file (change this if your file has a different name)
SOURCE = ./src/greyscale.cu

# Output executable name
EXECUTABLE = gs.exe

all: clean build

build: $(SOURCE)
	$(CXX) $(SOURCE) $(CXXFLAGS) $(STBFLAGS) -o $(EXECUTABLE) \
	-I$(CUDA_PATH)/include -I$(STB_PATH) \
	-L$(CUDA_PATH)/lib64 $(CUDA_LIBS)

run:
	./$(EXECUTABLE) $(ARGS)

clean:
	rm -f $(EXECUTABLE)

.PHONY: all build run clean