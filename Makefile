CPPFLAGS = -ansi  -Wall -Wconversion -O3  -march=core2

CXX := g++ ${CPPFLAGS}
CC := gcc
LINK := g++ -static -fPIC

# Includes
INCLUDES = -I.

# Common flags
COMMONFLAGS += $(INCLUDES)
NVCCFLAGS += $(COMMONFLAGS)
CXXFLAGS += $(COMMONFLAGS)
CFLAGS += $(COMMONFLAGS)

LIBS := -lshark -lpthread -lboost_serialization -lboost_system -lboost_filesystem -lboost_program_options

OBJS = main.cpp.o

TARGET = jakolla
LINKLINE = $(LINK) -o $(TARGET) $(OBJS) $(LIBS)

.SUFFIXES: .c .cpp .o

%.c.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
#	$(CC) -MM $(CFLAGS) $*.c > $*.d

%.cpp.o: %.cpp
	$(CXX) $(CXXFLAGS) $(DEFINES) -c $< -o $@
#	$(CXX) -MM $(CXXFLAGS) $*.cpp > $*.d

$(TARGET): $(OBJS) Makefile
	$(LINKLINE)


clean :
	-rm *.o $(TARGET)


