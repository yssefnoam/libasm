#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>

size_t ft_strlen(char *);
int		ft_strcmp(const char *, const char *);

int	main(void)
{
	int i;
	int	j;

	i =    strcmp("c", "c");
	j = ft_strcmp("c", "c");
	printf("result = dori %d\nresult = mine %d\n", i, j);
	return (0);
}
