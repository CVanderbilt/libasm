			global	_ft_strlen

			section	.text

_ft_strlen:
			xor		rax, rax            ;i = 0
while:
			cmp		BYTE [rdi + rax], 0 ; if (str[i] == 0)
			je		end                 ;     goto end
			inc		rax                 ; i++
			jmp		while               ; goto while
end:
			ret                         ;return (i)
