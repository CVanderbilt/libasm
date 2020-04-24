                global	_ft_list_sort
                extern  _ft_warning

                section	.text
_ft_list_sort:
                push    r15 ; prev
                push    r14 ; current
                push    r13 ; sorted
                push    r12 ; t_list **start
                push    rbx ; ft_cmp
                mov     rbx, rsi        ; rbx = ft_cmp
                mov     r12, rdi        ; r12 = start
                cmp     rbx, 0
                je      end
                cmp     r12, 0
                je      end
                cmp     QWORD[r12], 0
                je      end
                xor     r13, r13        ; r13 = false
while_a:
                cmp     r13, 0
                jne     end
                add     r13, 1
                mov     r15, [r12]      ; r15 = *start
                mov     r14, [r15 + 8]  ; r14 = prev->next
while_b:
                cmp     r14, 0
                je      while_a
                mov     rdi, [r15]
                mov     rsi, [r14]
                call    rbx
                cmp     eax, 0
                jle     advance
                mov     rdi, r13
                mov     rax, [r15]
                mov     rcx, [r14]
                mov     [r15], rcx
                mov     [r14], rax
                xor     r13, r13
advance:
                mov     r15, r14
                mov     r14, [r14 + 8]
                jmp     while_b
end:
                pop     rbx
                pop     r12
                pop     r13
                pop     r14
                pop     r15
                ret