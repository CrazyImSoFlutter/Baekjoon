#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void delete(int M, int *ary, int N){
	int i;
	for (i = M; i < N; i++)
		ary[i] = ary[i + 1];
}

int main() {
	int N, M;
	int *ary, *ans;
	int i = 0;
	int j = 0;
	int k;
	scanf("%d%d", &N, &M);
	ary = malloc(sizeof(int) * N);
	ans = malloc(sizeof(int) * N);
	while (i < N) {
		ary[i] = i + 1;
		i++;
	}
	i = M - 1;
	k = N;
	while (j < k) {
		ans[j] = ary[i];
		delete(i, ary, N);
		N--;
		i += M - 1;
		while (i >= N && N != 0)
			i -= N;
		j++;
	}
	printf("<");
	j = 0;
	while (j < k) {
		printf("%d", ans[j]);
		if (j != k - 1)
			printf(", ");
		j++;
	}
	printf(">");
}
