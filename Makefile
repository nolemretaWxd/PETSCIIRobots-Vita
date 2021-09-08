CXXFLAGS :=-g
LDFLAGS :=

CXXFLAGS += `pkg-config --cflags sdl2`
CXXFLAGS += `pkg-config --cflags sdl2_image`
LDFLAGS += `pkg-config --libs sdl2`
LDFLAGS += `pkg-config --libs sdl2_image`

SOURCES := petrobots.cpp
OBJECTS := $(SOURCES:.cpp=.o)
TARGET := petrobots

all: $(TARGET)

.cpp.o:
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(OBJECTS) $(TARGET)
