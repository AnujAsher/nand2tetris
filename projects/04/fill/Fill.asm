// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(MAINLOOP)
	@KBD
	D=M

	@PRESSED
	D;JNE

	@fill
	M=0

	@DRAW
	0;JMP

(PRESSED)
	@fill
	M=-1

(DRAW)
	@SCREEN
	D=A

	@addr
	M=D

(DRAWLOOP)
	@addr
	D=M

	@KBD
	D=D-A

	@MAINLOOP
	D;JEQ

	@fill
	D=M

	@addr
	A=M
	M=D

	@addr
	M=M+1

	@DRAWLOOP
	0;JMP