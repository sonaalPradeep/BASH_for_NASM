#!/bin/bash
if [ $1 = "-v" ]
then
	echo "BASH SCRIPT FOR ASSEMBLING NASM"
	echo -e "\t\t\tby Sonaal P. Pradeep"
	echo -e "Version 1.0"
	echo "\"Built for the lazy ones who need clever solutions.\""
	echo "Thanks a lot for using my code! :D"
	exit 1
fi

if [ $# -eq 0 ]
then 
	echo "$0: NOTE! : If this is the first time you are using the script, please configure it for your system. Please read the README.txt for further information."
	echo "Hello $USER! You can run this script by using 2 methods."
	echo "You can provide 3 arguments while executing the script. The arguments will be the name of your code (.asm) file, object file and executable along with their respective extensions."
	echo "Otherwise, you can just enter the name of your code file."
elif [ $# -eq 1 ]
then
	
	CODE=$1.asm
	OBJF=$1.o
	EXEC=out_$1

	if [ -f $CODE ]
	then
		nasm -f elf $CODE
	else

		if [ -f *.asm ]
		then
			echo "$0: The provided (.asm) file couldn't be found. The following file(s) were found in the present directory :"
			ls *.asm
		else
			echo "$0: No (.asm) files found in this directory."
		fi

		exit 1
	fi
	
	if [ -f $OBJF ]
	then
		#COMMENT THE FOLLOWING LINE FOR 32-BIT SYSTEMS...
	#	ld -melf_i386 $OBJF -o $EXEC

		#COMMENT THE FOLLOWING LINE FOR 64-BIT SYSTEMS...
	#	ld $OBJF -o $EXEC
	else
		echo "$0: Object file not found. Please check for compilation errors in your program."
		exit 1
	fi

	if [ -f $EXEC ]
	then
		./$EXEC
	else
		echo "$0 Executable not found."
		exit 1
	fi

elif [ $# -eq 3 ]
then

	CODE=$1
	OBJF=$2
	EXEC=$3
	
	if [ -f $CODE ]
	then
		nasm -f elf $CODE
	else

		if [ -f *.asm ]
		then
			echo "$0: The (.asm) file couldn't be found. The following files were found in the present directory :"
			ls *.asm
		else
			echo "$0: No .asm files found in this directory."
		fi

		exit 1
	fi

	if [ -f $OBJF ]
	then
		#COMMENT THE FOLLOWING LINE FOR 32-BIT SYSTEMS...
	#	ld -melf_i386 $OBJF -o $EXEC

		#COMMENT THE FOLLOWING LINE FOR 64-BIT SYSTEMS...
	#	ld $OBJF -o $EXEC
	else
		echo "$0: Object file not found. Please check for compilation errors, and make sure you have given the correct name for the object file."

		if [ -f *.o ]
		then 
			echo "$0: If your program compiled without any errors, your object files is one of these : "
			ls *.o
		fi

		exit 1
	fi
	
	if [ -f $EXEC ]
	then
		./$EXEC
	else
		echo "$0: Executable not found."
		exit 1
	fi
	
else
	echo "$0: The following argument set is invalid."
	echo "$0: Please run the script without any arguments for help"
fi

