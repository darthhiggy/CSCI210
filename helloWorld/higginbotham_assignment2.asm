;Source name                :higginbotham_assignment2.asm

;Mike Higginbotham
;Spring 2015 - CSCI 210
;Feb 15, 2015

[SECTION .text]           ;Section containing code

extern printf             ;Tells the compiler to reference the C function library for printf
global main               ;Required so linker can find entry point

main:                     ;Entry point of program
      push ebp            ;Sets up the stack frame
      mov ebp, esp
      push edx
      push esi
      push edi

      mov edi,29          ;moves the value of 29 to edi
      add edi, 42         ;adds 42 to edi and stores the value in edi
      mov esi, 29         ;moves the value of 29 into esi
      push dword edi      ;pushes the address of the int in edi
      push dword esi      ;pushes the value in esi
      push dword tx1      ;pushes the address of the string in tx1
      call printf         ;prints the string in tx1 with the variables esi and edi
      add esp, 12         ;adds the value of 12 to the stack pointer
                          ;to "clean up" the stack

      mov edi, 29         ;moves the value of 29 to edi
      imul edi, 7         ;multiplies the in edi by 7 and stores it in edi
      push edi            ;pushes the address of the int in edi
      push tx2            ;pushes the address of the string in tx2
      call printf         ;prints the string in ds with the variable edi
      add esp, 8          ;adds the value of 8 to the stack pointer
                          ;to "clean up" the stack

                          ;Bottom part of boilerplate code
      pop edi             ;program restores saved register values by
      pop esi             ;popping them from the stack as they
      pop ebx             ;were pushed from the beginning
      mov esp, ebp        ;destroys stack frame before returning
      pop ebp
      ret                 ;returns the control to Linux

      [SECTION .data]     ;section containing initialized data
      tx1 db "I am %d years old now and in 42 years I will %d years old.",10,0     ;defines name to be the string text
      tx2 db "In dog years, I am %d years old.",10,0                                    ;defines name to be the string text

      [SECTION .bss]      ;Section containing uninitialized data
