
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

void ft_putstr(char *c)
{
	write(1, c, strlen(c));
}

int	main(int ac, char **av)
{
	int pourcent;
	int i;
	unsigned char load = 219;

	i = 0;
	if (ac != 2)
		return (0);
	pourcent = atoi(av[1]);
	//printf("%d\n", pourcent);
	//ft_putstr("\033[A");
	while (i < 100)
	{
		if (i < pourcent)
		{
			ft_putstr("\033[32;5m");
		}
		else if (i == pourcent)
		{
			ft_putstr("\033[31m");
		}
		else
		{
			ft_putstr("\033[0m");
		}
		i++;
		ft_putstr("|");
	}
	ft_putstr("\033[0;A");
	ft_putstr("\n");
	return (0);
}
