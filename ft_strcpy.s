# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: test <marvin@42.fr>                        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/21 08:21:25 by test              #+#    #+#              #
#    Updated: 2020/04/21 08:21:28 by test             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global	_ft_strcpy

			section	.text

_ft_strcpy:
			xor		rcx, rcx            ; i = 0
			mov		rax, rdi
while:
			mov		rdx, [rsi + rcx]    ; aux = src[i]
			mov		[rdi + rcx], rdx    ; dst[i] = aux
			add		rcx, 1              ; i++
			cmp		BYTE [rsi + rcx], 0 ; if str[i] == 0
			je		end                 ;     goto end
			jmp		while               ; goto while
end:
			ret
