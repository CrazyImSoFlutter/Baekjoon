#include <stdio.h>
#include <stdlib.h>

void checkHigh(int *mine, int **answer, int current, int *p){
	int left = 0;
	int right = 0;
	if (mine[current] == mine[current - 1])
		left = 1;
	else if (mine[current] > mine[current - 1])
		left = 1;
	else
		left = 0;

	if (mine[current] == mine[current + 1])
		right = 1;
	else if (mine[current] > mine[current + 1])
		right = 1;
	else
		right = 0;

	if (left == 1 && right == 1){
		(*answer)[*p] = current + 1;
		(*p)++;
	}
}

int main (){
	int N;
	int *mine;
	int *answer;
	int a = 0;
	int *p;

	p = &a;
	scanf("%d", &N);
	mine = (int *)malloc(sizeof(int) * N);
	answer = (int *)malloc(sizeof(int) * N);
	for (int i = 0; i < N; i++){
		answer[i] = 0;
	}
	for (int i = 0; i < N; i++){
		scanf("%d", &mine[i]);
	}

	for (int i = 0; i < N; i++){
		if (i == 0 && mine[0] >= mine[1]){
			answer[a] = i + 1;
			a++;		
		} else if (i == N - 1 && mine[N-1] >= mine[N-2]){
			answer[a] = i + 1;
			a++;
		} else {
			checkHigh(mine, &answer, i, p);
		}
	}

	for (int i = 0; i < N; i++){
		if (answer[i] != 0){
			printf("%d", answer[i]);
		}
		if (i + 1 < N && answer[i + 1] != 0){
			printf("\n");
		}
	}
}
