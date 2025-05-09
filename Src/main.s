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
    RSB R4, R1, R2

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

loop:
	b end
