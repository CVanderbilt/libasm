                        global  _ft_atoi_base_simple
                        extern  _ft_strlen
                        extern  _ft_in_set
                        extern  _ft_power
			            section .text

_ft_atoi_base_simple:
                        ;rdi -> set
                        ;rsi -> str_size | numsize
                        ;rdx -> str
                        push    r12
                        push    r13
                        push    r14
                        push    r15
                        push    rbp
                        push    rbx
                        mov     r12, rdi ; set
                        mov     r13, rsi ; size
                        call    _ft_strlen
                        mov     r11, rax
                        xor     r15, r15
                        xor     r14, r14
                        xor     rbx, rbx
while:
                        mov     rdi, [rdx + r15]
                        mov     rsi, r12
                        call    _ft_in_set
                        cmp     rax, -1
                        je      end
                        
                        mov     rdi, r11
                        mov     rsi, r13
                        sub     rsi, r15
                        sub     rsi, 1
                        mov     rbp, rax
                        call    _ft_power
                        imul    rbp, rax
                        add     rbx, rbp
                        ;jmp     end

                        add     r15, 1
                        jmp     while
end:
                        mov     rax, rbx
                        pop     rbx
                        pop     rbp
                        pop     r15
                        pop     r14
                        pop     r13
                        pop     r12
                        ret
                        