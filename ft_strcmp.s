# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: test <marvin@42.fr>                        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/21 08:21:07 by test              #+#    #+#              #
#    Updated: 2020/04/21 08:21:10 by test             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global	_ft_strcmp

			section	.text

_ft_strcmp:
			xor		rcx, rcx
			xor		rax, rax
			xor		rdx, rdx
while:
			mov		al, [rdi + rcx]
			mov		dl, [rsi + rcx]
			sub		rax, rdx
			jnz		end
			cmp		dl, 0
			je		end
			add		rcx, 1
			jmp		while
end:
			ret;
