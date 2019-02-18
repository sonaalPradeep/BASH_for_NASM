NASM BASH SCRIPT ASSEMBLER AND EXECUTER			-by Sonaal P. Pradeep
Last Updated on 18th February 2018
#As of the last updated date, this project stands closed.

# Statements starting with a '#' are comments, as a note to the reader.
# Statements in between < ... > are commands. Type them without putting the brackets.
# Statements in between " ... " are names.

# Thank you for taking your time for reading and/or using this bash script which I honestly had no intention to push onto GitHub. This was purely just a project for fun to just solve my laziness. Yes I have now realised many people aren't as lazy as me, too lazy to run 3 lines of code with few key strokes. I would just prefer to write one. Never-the-less, I am really happy with how the code stands right now, and feel free to use it and break it in any way possible. Again, thank you soo much, it means a lot. Feel free to let me know for further modifications. 


INSTRUCTIONS FOR CONFIGURING FILE

The configuration of the bash script is simple. It is based on whether you are using a 32- or a 64-bit system. If you are using a 32-bit system, find the 2 instances which says "# Comment the following for 32-bit systems" and comment the line below it (by inserting a '#' to the front). Similarly for the 64-bit systems. Make sure that only one of your options is enabled.
# This script only works for Linux.


EXECUTING THE SCRIPT

Pull the script into the directory that has your program. If the script is not an executable, type <chmod +x nasm_bash.sh>.
You can run the executable by typing <./nasm_bash.sh>. After this, you will need to enter the arguments of the file.

You can either enter one arguemnt, or 3 arguments. If you are entering one argument, you can enter the file name with or without the extension.
For example, if your program is saved in "q1.asm", you type <./nasm_bash q1>. Your object file will be "q1.o" and the executable will be "out_q1". The same results will now be reciprocated when you type <./nasm_bash q1.asm>.

Alternatively, you can enter 3 arguments. As you would guess, you now have the freedom to give the names if the object file and the executable. Please note that you need to give the arguments of the files this time.

# NASM requires your file name and object name to be the same. So if your file name is "q1.asm", your object name is "q1.o", and other options will lead to an error.


