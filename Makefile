CC = gcc
CFLAGS = -Wall
LIB_SOURCES = library.c
LIB_OBJECTS = $(LIB_SOURCES:.c=.o)
LIB_NAME = libstring.a
EXEC = output
TEST_SRC = test.c $(LIB_SOURCES)
TEST_TARGET = exectests

all: $(LIB_SOURCES) $(EXEC)

$(EXEC): main.o $(LIB_NAME)
	$(CC) -o $@ $< -L. $(LIB_NAME)

%.o:%.c
	$(CC) $(CFLAGS) $< -c -o $@

$(LIB_NAME): $(LIB_OBJECTS)
	ar cr $@ $<

.PHONY: clean valgrind tests

clean:
	rm -f *.o $(LIB_NAME) $(EXEC)

tests:
	make
	$(CC) $(CFLAGS) -g -O0 $(TEST_SRC) -o $(TEST_TARGET) $(LIB_NAME)
	./$(TEST_TARGET)
	rm -f $(TEST_TARGET)

valgrind: $(EXEC)
	valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all ./$(EXEC)