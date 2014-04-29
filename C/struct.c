// Yunen He 2014
#include<stdio.h>

struct xypoint
{
	int x;
	int y;
};

struct xypoint p1;
struct xypoint *pp1;

int main ()
{
	p1.x = 4;
	printf("x: %d\n",p1.x);

	pp1 = &p1;
	(*pp1).y = 7;
	// pp1 -> y
	printf("y: %d\n",(*pp1).y);
	return 0;
}
