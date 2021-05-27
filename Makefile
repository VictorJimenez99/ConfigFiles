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

# if you have a new folder you can type make init 
# to create the folders necessary to execute this file

.PHONY: clean run init build_and_run

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



clean:
	rm -f target/objects/*.o target/$(PROJECT)

build_and_run:clean release
	@echo "Runing: $(PROJECT)" && \
	./target/$(PROJECT) && \
	echo "\nFinished"



run: all
	@echo "Runing: $(PROJECT)" && \
	./target/$(PROJECT) && \
	echo "\nFinished"

init:
	@echo "Creating folder structure"
	@echo "src dir"
	@if [ -d src ]; then \
		echo "  Folder src already exists";\
	else \
		mkdir src && \
		echo "  src folder created" && \
		touch src/main.c &&\
		echo "#include <stdio.h>\n">>src/main.c && \
		echo "int main(int argc, char **argv)" >>src/main.c && \
		echo "{\n    printf(\"Hello World\");\n}" >> src/main.c; \
	fi; 
	@echo "target dir"
	@if [ -d target ]; then \
		echo "  Target folder already exists"; \
	else \
		mkdir target && mkdir target/objects && \
		echo "  target folder created"; \
	fi;
	@echo "Finished"
	@echo "Edit the Makefile to change the name and configuration of your project"
	@echo "Type make build_and_run to test your program"
