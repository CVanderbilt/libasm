			global	_ft_strcpy

			section	.text

_ft_strcpy:
			xor		rcx, rcx            ; i = 0
			mov		rax, rdi
while:
			cmp		BYTE [rsi + rcx], 0 ; if str[i] == 0
			je		end                 ;     goto end
			mov		rdx, [rsi + rcx]    ; aux = src[i]
			mov		[rdi + rcx], rdx    ; dst[i] = aux
			inc		rcx                 ; i++
			jmp		while               ; goto while
end:
			ret
