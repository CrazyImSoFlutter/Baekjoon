#include <stdio.h>

int main(){
	int number[1000001];
	int N;
	int top;
	int current;
	int j;

	top = 0;
	current = 0;
	scanf("%d", &N);
	for (int i = 0; i < N; i++){
		scanf("%d", &number[top]);
		top++;
	}
	for (int i = 0; i < N; i++){
		j = current + 1;
		if (i == N - 1){
			printf("-1");
			break ;
		}
		while (number[current] >= number[j]){
			if (j < N)
				j++;
			if (j == N)
				break ;
		}
		if (j == N){
			printf("-1 ");
			current++;
			continue ;
		} else if (j != N && number[current] != number[j]){
			printf("%d ", number[j]);
			current++;
		} else {
			printf("-1 ");
			current++;
		}
	}
}
