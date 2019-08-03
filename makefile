cc     = g++
cflags = -Wall -g
lflags = sfml-app -lsfml-graphics -lsfml-window -lsfml-system
src    = $(wildcard *.cpp) \
		 $(wildcard **/*.cpp)
objs  := $(src:.cpp=.o)
target = tardious

all: $(target)
	echo $(src)

$(target): $(objs)
	$(cc) obj/*.o -L $(lflags) -o $(target)

$(objs): $(src)
	$(cc) $(cflags) -c $^
	mv *.o obj/
clean:
	rm $(target) obj/*.o 

run: 
	./$(target)
