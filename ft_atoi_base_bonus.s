			    global	_ft_atoi_base
                extern  _ft_atoi_base_simple
                extern  _ft_isspace
                extern  _ft_in_set
                extern  _ft_power
                extern  _ft_check_base
                extern  _ft_warning

			    section	.text

_ft_atoi_base:
                push    r12
                push    r13
                push    r14
                push    r15
                push    rbp
                xor     r12, r12            ; r12 -> i = 0
                cmp     rdi, 0              ; revisa que str > 0
                jle     error       
                cmp     rsi, 0              ; revisa que set > 0
                jle     error
                push    rdi
                push    rsi
                mov     rdi, rsi
                call    _ft_check_base
                pop     rsi
                pop     rdi
                cmp     rax, 0
                je      error
                mov     r14, rdi            ; r14 = rdi (str)
                                                                        ;mov     rdi, rsi
                                                                        ;call    _ft_check_set
                                                                        ;cmp     al, 0
                                                                        ;je      error
                mov     r13, rsi            ; r13 = rsi (set)
skip_spaces:
                mov     rdi, [r14 + r12]    ; rdi = str[i]
                call    _ft_isspace         ; isspace?
                cmp     rax, 0              ; if false
                je      pre_handle_sign         ; starts num string
                add     r12, 1
                jmp     skip_spaces
pre_handle_sign:
                xor     r11, r11
                jmp     handle_sign
minus_sign:
                add     r11, 1
plus_sign:
                add     r12, 1
handle_sign:
                mov     r15, [r14 + r12]
                cmp     r15b, 45
                je      minus_sign
                cmp     r15b, 43
                je      plus_sign
                jmp     pre_handle_num
pre_handle_num:
                test    r11b, 1
                jnz     odd
                xor     r11, r11
                add     r11, 1
                jmp     handle_num
odd:
                xor     r11, r11
                sub     r11, 1
handle_num:
                push    r11
                push    rcx
                xor     r15, r15              ; num size = 0
                mov     r11, r12
                xor     rdi, rdi
                mov     rdi, [r14 + r12]    ; rdi = src[i]
                call    _ft_in_set          ; rdi in base set?
                cmp     rax, 0              ; if false
                jl      error2              ; return 0
get_size:
                add     r15, 1
                add     r12, 1
                mov     rdi, [r14, + r12]
                call    _ft_in_set
                cmp     rax, 0
                jl      size_set
                jmp     get_size
size_set:
                ; mov     rax, r15

                mov     rdx, r14
                add     rdx, r11
                mov     rsi, r15
                mov     rdi, r13
                call    _ft_atoi_base_simple
                pop     rcx
                pop     r11
                imul    rax, r11
                pop     rbp
                pop     r15
                pop     r14
                pop     r13
                pop     r12
                ret
error2:
                pop     rcx
                pop     r11
error:
                pop     rbp
                pop     r15
                pop     r14
                pop     r13
                pop     r12
                xor     rax, rax
                ret