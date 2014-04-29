// Yunen He 2014
#include<stdio.h>

int stringlen(char *str)
{
	int res = 0;
	while(*str != 0)
	{
		printf("%c\n",*str);
		str++;
		res++;
	}
	return res;
}

int main()
{
	int len;
	char nameStr[] = "Yunen";
	len = stringlen(&nameStr[0]);
	printf("%d\n",len);
	return 0;
}
