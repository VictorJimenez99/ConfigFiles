# In order to use this Makefile your project 
# should have the following structure:
#  .
#  ├── Makefile
#  ├── src
#  │   └── main.c
#  └── target
#      └── objects
#
# you should change your PROJECT name 
# according to your needs, and as you can see 
# the src/main.c is mandatory.

CC=gcc
PROJECT=project_name
CFLAGS=-Wall
LFLAGS=
SRC_FILES = $(filter-out src/main.c, $(wildcard src/*.c))
OBJS := $(patsubst src/%.c, target/objects/%.o ,$(SRC_FILES))

all: target/$(PROJECT)

release: CFLAGS=-Wall -O2
release: target/$(PROJECT)


target/$(PROJECT): $(OBJS) src/main.c
	$(CC) $^ -o $@ $(CFLAGS) $(LFLAGS)


target/objects/%.o: src/%.c
	$(CC) -c $< $(CFLAGS) $(LFLAGS) -o $@


.PHONY: clean run


clean:
	rm -f target/objects/*.o target/$(PROJECT)

run:
	@echo "Runing: $(PROJECT)" && \
	./target/$(PROJECT) && \
	echo "\nFinished"

