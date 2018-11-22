# Arquivo de Script MakeFile 
# autor Gdiael Souto Barros
# arquivo origem em https://github.com/gdiael/EDB1_011_ElasticDict.git

# flag de comando
CC = g++

# flags para pastas

OBJ = ./build
SRC = ./src
BIN = ./bin
INC = ./include

# flags para os arquivos

F01C = main
F02_ = TestTable
F03_ = HashTable
F04H = HashEntry

# flags de entradas de compilação

PROG1 = $(BIN)/dict

# CPPFLAGS = -Wall -pedantic -std=c++11 -I$(INC)
# para usar como debug

CPPFLAGS = -g -Wall -pedantic -std=c++11 -I$(INC)

OBJ1 = $(OBJ)/$(F03_).o $(OBJ)/$(F02_).o $(OBJ)/$(F01C).o

all: mkdirs $(PROG1)

mkdirs:
	mkdir -p $(BIN)
	mkdir -p $(OBJ)

$(PROG1): $(OBJ1)
	$(CC) $(CPPFLAGS) -o $(PROG1) $(OBJ1)

$(OBJ)/$(F03_).o: $(SRC)/$(F03_).cpp $(INC)/$(F03_).h $(INC)/$(F04H).h
	$(CC) $(CPPFLAGS) -c $(SRC)/$(F03_).cpp -o $(OBJ)/$(F03_).o

$(OBJ)/$(F02_).o: $(SRC)/$(F02_).cpp $(INC)/$(F02_).h $(INC)/$(F03_).h
	$(CC) $(CPPFLAGS) -c $(SRC)/$(F02_).cpp -o $(OBJ)/$(F02_).o

$(OBJ)/$(F01C).o: $(SRC)/$(F01C).cpp $(INC)/$(F02_).h
	$(CC) $(CPPFLAGS) -c $(SRC)/$(F01C).cpp -o $(OBJ)/$(F01C).o

clean: 
	rm -f $(BIN)/*
	rm -f $(OBJ)/*

debug: clean $(PROG1)
	gdb $(PROG1)

run: all
	$(PROG1)



