# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: test <marvin@42.fr>                        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/21 08:21:42 by test              #+#    #+#              #
#    Updated: 2020/04/21 08:21:47 by test             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global  _ft_strdup
            extern  _ft_strlen
            extern  _ft_strcpy
            extern  _malloc
			
            section .text

_ft_strdup:
            push    rdi             ; preserve rdi
            call    _ft_strlen      ; rax = strlen(rdi)
            mov     rdi, rax        ; len = rax (rdi was preserved)
            add     rdi, 1          ; len++
            call    _malloc         ; rax = malloc(len)
            pop     rdi             ; rdi = str_to_copy (load preserved rdi)
            cmp     rax, 0          ; if rax <= 0
            je      end             ;   return 0
            mov     rsi, rdi        ; second arg = str_to_copy
            mov     rdi, rax        ; first arg = dest
            call    _ft_strcpy       ; ft_strcpy(dest, str_to_copy)
end:
            ret
