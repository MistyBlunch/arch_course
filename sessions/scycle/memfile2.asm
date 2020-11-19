// ; memfile2.asm
// ; david_harris@hmc.edu and sarah_harris@hmc.edu 3 April 2014

// MAIN:
// SUB R0, R15, R15 // PC: 00
// ADD R1, R0, #255 // PC: 04
// ADD R2, R1, R1 // PC: 08
// STR R2, [R0, #196] // PC: 0C
// EOR R3, R1, #77 // PC: 10
// AND R4, R3, #0x1F // PC: 14
// ADD R5, R3, R4 // PC: 18
// LDRB R6, [R5] // PC: 1C
// LDRB R7, [R5, #1] // PC: 20
// SUBS R0, R6, R7 // PC: 24
// BLT MAIN // PC: 28
// BGT HERE // PC: 30
// STR R1, [R4, #110] // PC: 34
// B MAIN // PC: 38
// HERE:
// STR R6, [R4, #110] // PC: 3C
//

E04F000F
E28010FF
E0812001
E58020C4
E221304D
E203401F
E0835004
E5D56000
E5D57001
E0560007
BAFFFFFE
CA00000D
E584106E
EAFFFFFE
E584606E
