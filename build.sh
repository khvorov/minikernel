#!/usr/bin/bash

nasm -f aout -o start.o start.asm
gcc -Wall -m32 -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I . -c -o main.o main.c
ld -T link.ld -m elf_i386 -o kernel.bin start.o main.o

