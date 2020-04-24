                        global	_ft_list_push_front
                        extern  _malloc

                        section	.text
_ft_list_push_front:
                        push    rbx                 ; alignment purposes
                        push    rdi                 ; save rdi
                        push    rsi                 ; save rsi
                        mov     rdi, 16             ; rdi = 16
                        call    _malloc             ; malloc(sizeof(t_list))
                        pop     rsi
                        pop     rdi
                        cmp     rax, 0              ; check malloc output
                        jle     error               ; do nothing if failed
                        mov     [rax], rsi          ; new_list->data = rsi
                        mov     rcx, [rdi]          ; aux = *list ([rdi])
                        mov     [rax + 8], rcx      ; new_list->next = aux
                        mov     [rdi], rax          ; *list = new_list
error:
                        pop     rbx                 ; realign
                        ret