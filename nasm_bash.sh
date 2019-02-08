#!/bin/bash

if [ $# -eq 0 ]
then 
	echo "NOTE! : If this is the first time you are using the script, please configure it for your system. Please read the README.txt for further information."
	echo "Hello $USER! You can run this script by using 2 methods."
	echo "You can provide 3 arguments while executing the script. The arguments will be the name of your code (.asm) file, object file and executable along with their respective extensions."
	echo "Otherwise, you can just enter the name of your code file."
elif [ $# -eq 1 ]
then
	
	CODE=$1.asm
	OBJF=$1.o
	EXEC=out_$1

	nasm -f elf $CODE
	#COMMENT THE FOLLOWING LINE FOR 32-BIT SYSTEMS...
#	ld -melf_i386 $OBJF -o $EXEC

	#COMMENT THE FOLLOWING LINE FOR 64-BIT SYSTEMS...
#	ld $OBJF -o $EXEC

	./EXEC

elif [ $# -eq 3 ]
then

	CODE=$1
	OBJF=$2
	EXEC=$3
	
	nasm -f elf $CODE
	#COMMENT THE FOLLOWING LINE FOR 32-BIT SYSTEMS...
#	ld -melf_i386 $OBJF -o $EXEC

	#COMMENT THE FOLLOWING LINE FOR 64-BIT SYSTEMS...
#	ld $OBJF -o $EXEC

	./EXEC
	
else
	echo "The following argument set is invalid."
	echo "Please run the script without any arguments for help"
fi

