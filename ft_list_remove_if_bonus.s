global	            _ft_list_remove_if

                    extern              _free
                    section	            .text
_ft_list_remove_if:
                    push                rbx ;
                    push                r12 ; start, later prev
                    push                r13 ; actual
                    push                r14 ; data
                    push                r15 ; cmp
                    mov                 r12, rdi    ; r12 -> (start)
                    mov                 r13, [r12]  ; r13 -> (actual) = *start
                    mov                 r14, rsi    ; r14 -> (data)
                    mov                 r15, rdx    ; ft_cmp
                    mov                 rbx, rdx    ; free_fct
while_1:
                    cmp                 r13, 0
                    je                  end

                    mov                 rdi, r14    ; arg1 = data
                    mov                 rsi, [r13]  ; arg2 = actual->data
                    call                r15
                    ;jmp                 error
                    
                    cmp                 rax, 0
                    jne                 else_1
                    mov                 r11, [r13 + 8]  ; aux = actual->next
                    mov                 [r12], r11      ; *start = aux
                    mov                 rdi, [r13]
                    call                rbx             ; free actual->data
                    mov                 rdi, r13
                    call                _free           ; free actual
                    mov                 r13, [r12]      ; actual = *start
                    jmp                 while_1
else_1:
                    mov                 r12, r13        ; r12 now is prev, prev = actual
                    mov                 r13, [r13 + 8]  ; actual = actual->next same as prev->next
while_2:
                    cmp                 r13, 0
                    je                  end
                    mov                 rdi, r14    ; arg1 = data
                    mov                 rsi, [r13]  ; arg2 = actual->data
                    call                r15
                    cmp                 rax, 0
                    jne                 else_2
                    mov                 r11, [r13 + 8]  ; aux = actual->next
                    mov                 [r12 + 8], r11  ; prev->next = aux
                    mov                 rdi, [r13]
                    call                rbx             ; free actual->data
                    mov                 rdi, r13
                    call                _free           ; free actual
                    mov                 r13, [r12 + 8]  ; actual = prev->next
                    jmp                 while_2
else_2:
                    mov                 r12, r13        ; prev = actual
                    mov                 r13, [r12 + 8]  ; prev->next
                    jmp                 while_2
end:
                    pop                 r15
                    pop                 r14
                    pop                 r13
                    pop                 r12
                    pop                 rbx
                    ret
error:
                    xor                 r9, r9
                    mov                 r9, [r9]