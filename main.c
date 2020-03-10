/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eherrero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/10 15:10:56 by eherrero          #+#    #+#             */
/*   Updated: 2020/03/10 18:19:24 by eherrero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

size_t	ft_strlen(const char *str);
char	*ft_strcpy(char *dest, const char *src);
char	ft_strcmp(const char *s1, const char *s2);

void	ft_try_strlen(char *str)
{
	printf("  try >%s<\n", str);
	printf("  %lu = %lu\n", strlen(str), ft_strlen(str));
}

void	ft_strlen_test(void)
{
	printf("\nSTRLEN TESTS START:\n");
	ft_try_strlen("dfdklfsk´f´ds  lfdd´ffd    ps ");
	ft_try_strlen("");
	ft_try_strlen("hola5");
	ft_try_strlen("hola5");
	ft_try_strlen("hol					k				ff																						tabs				a5");
	printf("STRLEN TESTS END:\n");
}

void	ft_try_strcpy(const char *src)
{
	char dest[30];

	strcpy(dest, src);
	printf("  original >%s<\n", dest);
	ft_strcpy(dest, src);
	printf("  propio   >%s<\n", dest);
}

void	ft_strcpy_test(void)
{
	printf("\nSTRCPY TESTS START:\n");
	ft_try_strcpy("hola");
	ft_try_strcpy("");
	ft_try_strcpy("holaquetal			tabs		k");
	ft_try_strcpy("1");
	printf("STRCPY TESTS END:\n");
}

void	ft_try_strcmp(const char *str1, const char *str2)
{
	printf("compara >%s< con >%s<\n", str1, str2);
	printf("  original %d\n", strcmp(str1, str2));
	printf("  propio   %d\n", ft_strcmp(str1, str2));
}

void	ft_strcmp_test(void)
{
	printf("\nSTRCMP TEST START:\n");
	ft_try_strcmp("abcdefh", "abcdefg");
	printf("\nSTRCMP TEST END:\n");
}

int		main()
{
	//ft_strlen_test();
	//ft_strcpy_test();
	ft_strcmp_test();
}
