// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// multiplicand=R0;
	@R0
	D=M

	@multiplicand
	M=D

// multiplier=R1;
	@R1
	D=M

	@multiplier
	M=D

// sum=0;
	@sum
	M=0

(LOOP)
// while(multiplier--)
	@multiplier
	D=M

	@STOP
	D;JEQ

	@multiplier
	M=D-1

// sum=sum+multiplicand;
	@sum
	D=M

	@multiplicand
	D=D+M

	@sum
	M=D

	@LOOP
	0;JMP

(STOP)
// R2=sum;
	@sum
	D=M

	@R2
	M=D

(END)
	@END
	0;JMP