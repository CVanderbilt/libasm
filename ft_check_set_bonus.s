			    global	_ft_check_set
_ft_check_set:
                push    r12 ; contador1
                push    r13 ; contador2
                push    r14 ; letra1
                push    r15 ; letra2
                xor     r12, r12
                xor     rax, rax
                add     rax, 1
                sub     r12, 1
while_1cs:
                add     r12, 1
                mov     r14, [rdi + r12]
                cmp     r14b, 0
                je      end_cs
                mov     r13, r12
t5:
                add     r13, 1
while_2cs:
                mov     r15, [rdi + r13]
                cmp     r15b, 0
                je      while_1cs
                cmp     r15b, r14b
                je      false_cs
                add     r13, 1
                jmp     while_2cs
false_cs:
                sub     rax, 1
end_cs:
                pop     r15
                pop     r14
                pop     r13
                pop     r12
                ret