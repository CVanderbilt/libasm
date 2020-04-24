			    global	_ft_power

			    section	.text

_ft_power:
                mov     rcx, rdi
                xor     rax, rax
                add     eax, 1
while:
                cmp     esi, 0
                jl      error
                je      end
                imul    eax, ecx
                sub     rsi, 1
                jmp     while
error:
                xor     rax, rax
end:
                ;xor     rax, rax
                ;mov     eax, ecx
                ret