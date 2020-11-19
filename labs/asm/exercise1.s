.text ; the following is executable assembly
    ; Ensure code section is 4-byte aligned:
    .balign 4
    ; main is the entry point and must be global
    .global main
     B main ; begin at main
    main:
     mov r0, #5 ; load nth Fibonacci number here
     mov r1, #0 ; valor base
     mov r2, #1 ; valor base
     mov r3, #0
     
    loop:
     add r3, r1, r2 ; sum of r1 and r2 and stores the result in r3
     mov r1, r2 ; store the value of r2 in r1 before so as not to lose the value of r2
     mov r2, r3 ; store the value of r3 in r2 
     
     sub r0, #1 ; r0 is our counter, so it must be subtracted by 1
     
     cmp r0, #1 ; compare r0 with 1 to branch
     bgt loop ; if r0 is greater than 1 we return to the loop
     bleq done ; this branch will goes to done label if r0 is equal to 1
     mov r0, r2 ; so the pc will take me this line, so that it returns the final value in r0
     
    done:
     mov pc, lr ; if r0 is equal to 0 the pc will be lr(this is the instruction after bleq is done)
    .end ; end of code