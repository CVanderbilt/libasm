                global	_ft_list_size

                section	.text
_ft_list_size:
                xor     rax, rax        ; size = 0
while:
                cmp     rdi, 0          ; if *list(rdi) = 0
                je      end             ; end
                add     rax, 1          ; size++
                mov     rdi, [rdi + 8]  ; advance list
                jmp     while
end:
                ret