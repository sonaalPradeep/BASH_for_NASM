#!/bin/bash
#
#clear

if [ $1 = "-v" ]
then
	echo "BASH SCRIPT FOR ASSEMBLING AND EXECUTING NASM CODES"
	echo -e "\t\t\t\t\tby Sonaal P. Pradeep"
	echo "Version 1.1.2"
	echo "Last updated on the 21st of February, 2019"
	echo "\"Built by the lazy one who needed a solution.\""
	echo "Thanks a lot for using my code! :D"
	exit 1
fi

if [ ! -f /usr/bin/nasm ]
then
	echo "$0: NASM assembler not found on this system."
	echo "Would to like to download (Y/N) : "
	read p

	if [ $p = 'y' ]  || [ $p = 'Y' ]
	then
		sudo apt-get nasm
		echo "Please restart the script again."
	else
		echo "Download aborted."
	fi

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
	
	A=$1
	len=${#1}

	if [ ${1##*.} = "asm" ]
	then
		let len=len-4
		A=${1:0:len}
	fi

	CODE=$A.asm
	OBJF=$A.o
	EXEC=out_$A

	if [ -f $CODE ]
	then
		nasm -f elf $CODE
	else

		if [ -n "$(echo *.asm)" ]
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
		echo "$0: Executable not found."
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

		if [ -n "$(echo *.asm)" ]
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
	echo "Please run the script without any arguments for help"
fi

