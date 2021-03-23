#include <stdio.h>

int main ()
{
	int A, B, V;
	int climb;
	int VP;

	scanf("%d %d %d", &A, &B, &V);
	climb = A - B;
	VP = V - A;
	if (VP % climb != 0)
		printf("%d", (VP / climb) + 2);
	else
		printf("%d", (VP / climb) + 1);
}
