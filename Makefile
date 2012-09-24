SRC=gnu_getopt.c
OBJ=gnu_getopt.o
LIB=libgnu_getopt.a

prefix=/usr/local
libdir=$(prefix)/lib

-include config.mak

all: $(LIB)

install: install-libs

clean:
	rm -f $(OBJ)
	rm -f $(LIB)

$(LIB): $(OBJ)
	ar rc $@ $<
	ranlib $@

$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c $< -o $@

$(DESTDIR)$(libdir)/%: $(LIB)
	install -D -m 644 $< $@

install-libs: $(LIB:lib%=$(DESTDIR)$(libdir)/lib%)

.PHONY: all clean install install-libs
