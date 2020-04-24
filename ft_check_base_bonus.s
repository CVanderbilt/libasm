                global  _ft_check_base
                extern  _ft_isspace

			    section	.text

_ft_check_base:
                xor     rax, rax
                xor     rcx, rcx
                cmp     BYTE[rdi], 0
                je      invalid
                cmp     BYTE[rdi + 1], 0
                je      invalid
                xor     rcx, rcx
                cmp     BYTE[rdi], 45
                je      invalid
                cmp     BYTE[rdi], 43
                je      invalid
                push    rdi
                mov     rdi, [rdi]
                call    _ft_isspace
                pop     rdi
                cmp     rax, 0
                jne     invalid
                jmp     while1
increment:
                add     rcx, 1
while1:
                mov     rdx, rcx
                add     rdx, 1
                mov     r9b, [rdi + rcx]
                cmp     r9b, 0
                je      end
while2:
                mov     r8b, [rdi + rdx]
                cmp     r8b, 0
                je      increment
                cmp     r8b, r9b
                je      invalid
                cmp     r8b, 45
                je      invalid
                cmp     r8b, 43
                je      invalid
                add     rdx, 1
                jmp     while2
                push    rdi
                mov     rdi, r8
                call    _ft_isspace
                pop     rdi
                cmp     rax, 0
                jne     invalid
end:
                xor     rax, rax
                add     rax, 1
                ret
invalid:
                xor     rax, rax
                ret