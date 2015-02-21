;Source name      :helloWorld.asm

;Mike Higginbotham
;Spring 2015 - CSCI 210
;Feb 15, 2015

[SECTION .text]   ;Section containing code

extern printf       ;Tells teh compiler to reference the C function library for printf
global main         ;Required so linker can find entry point

main:               ;Entry point of program
    push ebp        ;Sets up the stack frame
    mov ebp, esp
    push edx
    push esi
    push edi

    push dword hw   ;pushes the address of the string hw
    call printf     ;prints the string hw to the screen
    add esp, 4      ;adds the value of 4 to the stack pointer
                    ;to "clean up" the stack


                ;;Bottom part of boilerplate code
    pop edi         ;program restores saved register values by
    pop esi             ;popping them from the stack as they
    pop ebx             ;were pushed from the beginning
    mov esp, ebp        ;destorys stack frame before returning
    pop ebp
    ret             ;returns the control to Linux

    [SECTION .data]   ;section containing initialized data
        hw    db    "Hello World",10,0    ;defines name to be the string "Hello World!"

    [SECTION .bss]    ;Section containing initialized data
