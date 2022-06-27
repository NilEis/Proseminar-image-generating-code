CC = gcc
SRC = src
SRCS = $(wildcard $(SRC)/*.c)
OBJ = obj
OBJS = $(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))
DFLAGS = -g3 -Wall
FLAGS = -O3 -Wall
LFLAGS = -O3 -static
BINDIR = bin
BIN = $(BINDIR)/Proseminar_xor_texture

ifeq ($(OS),Windows_NT)
RM = del /Q /F
CP = copy /Y
ifdef ComSpec
SHELL := $(ComSpec)
endif
ifdef COMSPEC
SHELL := $(COMSPEC)
endif
else
RM = rm -rf
CP = cp -f
endif

all: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(OBJS) $(FLAGS) $(LFLAGS) -o $@

$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(FLAGS) -c $< -o $@

.PHONY : clean run

ifeq ($(OS),Windows_NT)
OBJS := $(subst /,\, $(OBJS))
BIN := $(subst /,\, $(BIN))
endif
clean:
	$(RM) $(BIN).* $(OBJS)

run: all
	$(BIN)
