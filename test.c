#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

/*
** Useful macros
*/
# define STRLEN(x)			printf("`%s` = %d (%d)\n", x, ft_strlen(x), (int)strlen(x));
# define STRCMP(a, b)		printf("`%s`:`%s` = %d (%d)\n", a, b, ft_strcmp(a, b), strcmp(a, b));
# define DUP(s)				tmp = ft_strdup(s); printf("`%s` (`%s`)\n", tmp, s); free(tmp); tmp = NULL;

/*
** Function prototypes
*/
int		ft_strlen(char const *str);

int		ft_strcmp(char const *s1, char const *s2);

char	*ft_strcpy(char *dst, char const *src);

ssize_t	ft_write(int fd, void const *buf, size_t nbyte);

ssize_t	ft_read(int fd, void *buf, size_t nbyte);

char	*ft_strdup(char const *s1);

/*
** Start !
*/
int		main(void)
{
	int		i;
	long	r;
	char	buffer[100];
	char	*tmp;
	char	*tmp2;

	r = 0;
	i = 0;
	while (i < 100)
		buffer[i++] = 0;

	printf("--strlen\n");
	STRLEN("")
	STRLEN("toto")
	STRLEN("totototo")
	STRLEN("0123456789abcdef")
	STRLEN("42")
	STRLEN("1")
	printf("-done\n");

	printf("\n--strcmp\n");
	/**/
	STRCMP("", "")
	STRCMP("toto", "toto")
	STRCMP("", "toto")
	STRCMP("toto", "")
	STRCMP("toto", "totobar")
	printf("-done\n");

	printf("\n--strcpy\n");
	printf("`%s` (`toto`)\n", ft_strcpy(buffer, "toto"));
	printf("`%s` (empty)\n", ft_strcpy(buffer, ""));
	printf("`%s` (`long message`)\n", ft_strcpy(buffer, "long message"));
	printf("-done\n");

	printf("\n--write\n");
	int n;

    n = ft_write(1, "holamundo", 9);
    printf(" -> %d\n", n);
    n = ft_write(1, "holamundo", 1);
    printf(" -> %d\n", n);
    n = ft_write(1, "holamundolonglonglong", 20);
    printf(" -> %d\n", n);
	printf("-done\n");

	printf("\n--ft_strdup\n");
	tmp2 = ft_strdup("toto");
	DUP(tmp2)
	free(tmp2);
	DUP("totobar")
    printf("1\n");
	DUP("long message")
    printf("2\n");
	DUP("")
	printf("-done\n");


    printf("\n--ft_read\n");
    int fd = open("tst.txt", O_RDONLY);
    char line[50];
    n = ft_read(fd, line, 12);
    line[n] = 0;
    printf("line (%d)>%s<\n", n, line);
    n = ft_read(fd, line, 42);
    line[n] = 0;
    printf("line (%d)>%s<\n", n, line);
    n = ft_read(fd, line, 15);
    line[n] = 0;
    printf("line (%d)>%s<\n", n, line);
	return (0);
}