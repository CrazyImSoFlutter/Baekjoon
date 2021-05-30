#include <stdio.h>
#include <stdlib.h>

int compare(const void *a, const void *b)
{
	int num1 = *(int *)a;
	int num2 = *(int *)b;

	if (num1 > num2)
		return (-1);
	else if (num1 < num2)
		return (1);
    else
        return (0);
}

int main (void)
{
	int N = 0;
	int M = 0;
	scanf("%d%d", &N, &M);
    int *p = malloc(sizeof(int) * M);
	int	*q = malloc(sizeof(int) * M);
    for (int i = 0; i < M; i++)
        scanf("%d", &p[i]);
	qsort(p, M, sizeof(int), compare);
	int answer1 = 0;
	int answer2 = 0;
	if (N >= M)
	{
		for (int i = 0; i < M; ++i)
		{
			if (answer2 < p[i] * (i + 1))
			{
				answer1 = p[i];
				answer2 = p[i] * (i + 1);
			}
		}
	}
	else
	{
		for (int i = 0; i < N; ++i)
		{
			if (answer2 < p[i] * (i + 1))
			{
				answer1 = p[i];
				answer2 = p[i] * (i + 1);
			}
		}
	}
	printf("%d %d", answer1, answer2);
}
