# Makefile for compiling the lightpaint.so Python/C module.

CC     = gcc
CFLAGS = -fPIC -Ofast -fomit-frame-pointer -funroll-loops

all: lightpaint.so

lightpaint.so: lightpaint.o
	gcc -s -shared -I/usr/include/python3.9 -Wl,-soname,liblightpaint.so -o $@ $<

.c.o:
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f lightpaint.o lightpaint.so
