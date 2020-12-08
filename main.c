#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
int     ft_write(int i, char *ss, int j);
int main()
{
    ft_write(-1,"st",4);
    write(-1,"st",4);
}
