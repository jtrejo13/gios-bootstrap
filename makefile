CC = gcc
CFLAGS = -Wall -Wextra -std=c99
LDFLAGS = -lcmocka

SOURCES = hello.c
OBJECTS = $(SOURCES:.c=.o)
EXECUTABLE = hello

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@


clean:
	rm -f $(OBJECTS) $(EXECUTABLE)