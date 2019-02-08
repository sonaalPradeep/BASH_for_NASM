#!/bin/bash

CODE=$1
OBJF=$2
EXEC=$3

nasm -f elf $CODE
ld -melf_i386 $OBJF -o $EXEC
./$EXEC

echo "COMPLETED"
