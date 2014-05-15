// Yunen He 2014
#include<stdio.h>

int gcd(int x,int y)
{
	// x >= y and y >= 0
	if (y == 0)
		return x;
	else
		return gcd(y, x % y);
}

int main ()
{
	int result = gcd(5,3);
	printf("%d\n",result);
}
