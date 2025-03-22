CFLAGS = -O2 -g -Og -g -Wall -Wextra -pedantic -Wno-unused-parameter -Wstrict-prototypes -std=gnu99 -Wshadow -Wconversion -Wvla -Wdouble-promotion -Wmissing-noreturn -Wmissing-format-attribute -Wmissing-prototypes -fsigned-char -fno-common -Wno-unused-result -Wno-fallthrough

SRC = main.c

all: compile_complete

CHECK_SRC:
	@if [ ! -f $(SRC) ]; then \
		echo "Error: $(SRC) not found!"; \
		exit 1; \
	fi

compile_complete: CHECK_SRC
	@/usr/bin/time -p gcc $(CFLAGS) $(SRC) -o a.out 2>&1

clang: CHECK_SRC
	@clang $(CFLAGS) $(SRC) -o a.out

run:
	@./a.out

.PHONY: clean
clean:
	rm -f a.out


#linking/ compiling 2 files

#all: main.o library.o
#	gcc $(CFLAGS) main.o library.o

#main.o: main.c 
#	gcc $(CFLAGS) -c main.c

# library.o: library.c
#	gcc $(CFLAGS) -c library.c


#clean: 
#	@echo "removing everything, expect the source files"
#	rm  main.o library.o tictac.exe
