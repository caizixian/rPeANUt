// Yunen He 2014
#include<stdio.h>
char str[] = "Hello";
char *ptr;

int main()
{
	ptr = &str[0];
	// ptr = str;

	while(*ptr != 0)
	{
		printf("%c\n",*ptr);
		ptr++;
	}
	return 0;
}
