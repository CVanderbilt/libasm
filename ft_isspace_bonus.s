			    global	_ft_isspace

			    section	.text

_ft_isspace:    
                xor     rax, rax
                cmp     dil, 9
                jl      false
                cmp     dil, 13
                jle     true
                cmp     dil, 32
                jle     true
false:
                ret
true:
                add     rax, 1
                ret

