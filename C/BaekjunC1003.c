#include <stdio.h>

int fiboZero(int x, int *data){
	if (x == 0)
		return 1;
	if (x == 1)
		return 0;
	if (data[x] != 0) {
		return data[x];
	} else {
		data[x] = fiboZero(x-1, data) + fiboZero(x-2, data);
		return data[x];
	}
}

int fiboOne(int x, int *data){
	if (x == 0)
		return 0;
	if (x == 1)
		return 1;
	if (data[x] != 0) {
		return data[x];
	} else {
		data[x] = fiboOne(x-1, data) + fiboOne(x-2, data);
		return data[x];
	}
}

int main(void) {
	int dataZero[100] = {0, };
	int dataOne[100] = {0, };
	int T;
	int N;
	int tmp;
	
	scanf("%d" ,&T);
	for (int i = 0; i < T; i++){
		scanf("%d", &N);

		printf("%d %d\n", fiboZero(N, dataZero), fiboOne(N, dataOne));
	}
}
