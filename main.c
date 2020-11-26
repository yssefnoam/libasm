#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>

extern size_t ft_strlen(char *);

int	main(void)
{
	printf("result = %ld\n",ft_strlen("hi my name is youssef noam\0"));
	printf("result = %ld\n",   strlen("hi my name is youssef noam\0"));
	return (0);
}
