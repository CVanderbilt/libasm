nasm -f macho64 ft_strlen.s
nasm -f macho64 ft_strcpy.s
nasm -f macho64 ft_strcmp.s
gcc ft_strlen.o ft_strcpy.o ft_strcmp.o main.c
