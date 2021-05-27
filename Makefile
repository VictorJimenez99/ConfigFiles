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

# As of today this file has one level recursion, which means
# that you can use subforlders in src but just one level deep 

.PHONY: clean run init cbr

CC=gcc
PROJECT=project_name
CFLAGS=-Wall
LFLAGS=

BASE_FILES = $(filter-out src/main.c, $(wildcard src/*.c)) 
ONE_LVL_REC = $(wildcard src/*/*.c)

SRC_FILES = $(BASE_FILES) $(ONE_LVL_REC)

BASE_OBJS := $(patsubst src/%.c, target/objects/%.o ,$(BASE_FILES))
REC_OBJ := $(patsubst %.c, target/objects/%.o, $(notdir $(ONE_LVL_REC)))
OBJS := $(BASE_OBJS) $(REC_OBJ)

all: target/$(PROJECT)

release: CFLAGS=-Wall -O2
release: target/$(PROJECT)



target/$(PROJECT): $(OBJS) $(REC_OBJ) $(SRC_FILES) src/main.c 
	@echo -n "\033[0;32mCompiling..."
	@$(CC) $^ -o $@ $(CFLAGS) $(LFLAGS)
	@echo "$(tput setaf 2)Done...\033[0m"

$(OBJS): $(SRC_FILES)
	$(CC) -c $< $(CFLAGS) $(LFLAGS) -o $@


clean:
	rm -f target/objects/*.o target/$(PROJECT)

cbr:clean release
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
		echo -n "{\n    printf(\"Hello World\");\n}" >> src/main.c; \
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
	@echo "Type make cbr to test your program (clean build and run)"
