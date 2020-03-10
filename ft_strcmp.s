			global	_ft_strcmp

			section	.text

_ft_strcmp:
			xor		rcx, rcx
while:
			mov		rdx, [rdi + rcx]
			mov		rax, [rsi + rcx]
			cmp		rax, rdx
			jne		end
			cmp		BYTE [rdi + rcx], 0
			je		end2
			inc		rcx
			jmp		while
end:
			sub		rax, rdx
			;mov		rax, [rsi + rcx]
			;add		rax, 100
			ret;
end2:
			sub		rax, [rdi + rcx]
			;mov		rax, rcx
			ret;

