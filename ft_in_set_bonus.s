			    global	_ft_in_set

			    section	.text

_ft_in_set:
                xor     rax, rax
while:
                mov     cl, [rsi + rax]
                cmp     cl, 0
                je      not_found
                cmp     cl, dil
                je      found
                add     rax, 1
                jmp     while
not_found:
                xor     rax, rax
                sub     rax, 1
found:
                ret