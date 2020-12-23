#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>

int	main(void)
{
	char *str = malloc(10);
	ft_read(0, str, 9);
	str[9] = 0;
	printf("%s\n", str);
	//ft_strcmp();
	//ft_strcpy();
	//ft_strdup();
	//ft_strlen();
	//ft_write();
	return (0);
}
