OBJS 	= drat-trim2.o
CXX 	= g++

CPPFLAGS 	= -Wall -Wno-deprecated -O3 -ggdb
LFLAGS 	= -Wall -lz
NAME 	= drat-trim2
prefix  = /usr/local

$(NAME) : $(OBJS)
	$(CXX) -o $(NAME) $(OBJS) $(LFLAGS)

drat-trim2.o : drat-trim2.c 
	$(CXX) $(CPPFLAGS) -c drat-trim2.c

clean:
	rm -f *.o 
	rm -f $(NAME)

install: drat-trim
	install -m 0755 drat-trim2 $(prefix)/bin

.PHONY: install
