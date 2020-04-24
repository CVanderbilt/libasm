# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: test <marvin@42.fr>                        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/21 08:22:13 by test              #+#    #+#              #
#    Updated: 2020/04/21 08:22:14 by test             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global	_ft_write

			section	.text

_ft_write:
            xor     rax, rax
            sub     rax, 1
            cmp     edx, 0
            jl      end
            cmp     esi, 0
            jl      end
            mov     rax, 0x2000004
            syscall
end:
            ret
