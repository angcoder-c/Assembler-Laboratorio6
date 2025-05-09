/*
Laboratorio 6
Grupo 4
https://users.ece.utexas.edu/~valvano/EE345L/Labs/Fall2011/CortexM_InstructionSet.pdf
*/

.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.global main


main:

	// limpiar la memoria
	MOV R0, #0

	// 1. Operaciones
	LDR R1, =0xC0
    LDR R2, =0x1F

    SUB R3, R1, R2

    // 2. RSB vs SUB
    RSB R0, R1, R2

    // 3. limpiar R7 con 0
    LDR R7, =10
    SUB R7, R7, R7

    LDR R7, =10
    MOV R7, #0

    LDR R7, =10
    BIC R7, R7, 0xffffffff

    LDR R7, =10
    BFC R7, #0, #32

    // 4. complemento a 2 sin sub y otros registro
    LDR R0, =5
    MVN R0, R0
    ADD R0, R0, 1

    // 5. b multiplicacion
    // 01111111110101010101111100001010 = 7FD55F0A
    // 01111111110101010101111100001000 = 7FD55F08
    LDR R1, =0b01111111110101010101111100001010
    LDR R2, =0b01111111110101010101111100001000
    MUL R3, R1, R2

    // 6. count down
    // (12*74)*3-(9*12*3)+2+3
    LDR R0, =74
    LDR R1, =3
    LDR R2, =11
    LDR R3, =12
    LDR R4, =9
    LDR R5, =2

    MUL R6, R0, R3
    MUL R6, R6, R1
    MUL R7, R4, R3
    MUL R7, R7, R1
    SUB R8, R6, R7
    ADD R8, R8, R5
    ADD R8, R8, R1

    // ((1-(-6)-(-4)) * 9)
    // *
    // ((-4)+9-1)
    // +
    // (23*15)
    // +
    // ((-4)-9)
    LDR R0, =1
    LDR R1, =23
    LDR R2, =-4
    LDR R3, =15
    LDR R4, =-6
    LDR R5, =9

    // (1-(-6)-(-4)) * 9
    SUB R6, R0, R4
    SUB R6, R6, R2
    MUL R6, R6, R5


    // (-4)+9-1
    ADD R7, R2, R5
    SUB R7, R7, R0

    // (23*15)
    MUL R8, R1, R3

    // ((-4)-9)
    SUB R9, R2, R5

    // FINAL
    MUL R10, R6, R7
    ADD R10, R10, R8
    ADD R10, R10, R9

loop:
	b end
