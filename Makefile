CC=gcc-9
PROG = ul_decomp

CFLAGS = -Wall -Wextra -Wpedantic -ggdb
LDLIBS = -lgfortran

default: bin/$(PROG)

bin/$(PROG): bin/$(PROG).o
	$(CC) $(CFLAGS) $^ $(LDLIBS) -o $@

bin/$(PROG).o: src/$(PROG).f
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -fv bin/*.o bin/$(PROG)
