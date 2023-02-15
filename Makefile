#
# Project name
# Project desc
#
# Eise Zimmerman
#
# Licensed under the MIT license (https://opensource.org/licenses/MIT)
#

PROJNAME=project-name
CC=gcc
CFLAGS=-std=c89 -Wall -Wextra -I$(INC)

BIN=bin
SRC=src
INC=inc
OBJ=obj
SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c,$(OBJ)/%.o,$(SRCS))


all: debug

debug: CFLAGS += -DDEBUG -g
debug: $(BIN)/$(PROJNAME)
release: CFLAGS += -DNDEBUG -O3
release: clean
release: $(BIN)/$(PROJNAME)

$(BIN)/$(PROJNAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: $(SRC)/%.c
	$(info    $(SRCS))
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) -r $(BIN)/* $(OBJ)/*
