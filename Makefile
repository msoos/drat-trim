OBJS 	= drat-trim.o 
CC 	= gcc

CFLAGS 	= -Wall -Wno-deprecated -O3 -ggdb
LFLAGS 	= -Wall
NAME 	= drat-trim
prefix  = /usr/local

$(NAME) : $(OBJS)
	$(CC) -o $(NAME) $(OBJS) $(LFLAGS)

drat-trim.o : drat-trim.c 
	$(CC) $(CFLAGS) -c drat-trim.c

clean:
	rm -f *.o 
	rm -f $(NAME)

install: drat-trim
	install -m 0755 drat-trim $(prefix)/bin

.PHONY: install
