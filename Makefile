CC=clang
CFLAGS=-W -pedantic-errors

all: clean tetris

tetris: gamedata.o tetris.o
	$(CC) $(CFLAGS) gamedata.o tetris.o `pkg-config --libs raylib` -o tetris

tetris.o: tetris.h tetris.c
	$(CC) $(CFLAGS) -c `pkg-config --cflags raylib` tetris.c

gamedata.o: gamedata.h gamedata.c
	$(CC) $(CFLAGS) -c gamedata.c

clean:
	rm gamedata.o tetris.o tetris
