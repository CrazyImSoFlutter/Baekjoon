#include <stdio.h>

int min3(int a, int b, int c){
	if (a <= b && a <= c)
		return a;
	else if (b <= a && b <= c)
		return b;
	else if (c <= a && c <= b)
		return c;
	return 0;
}

int min2(int a, int b){
	return (a <= b) ? a : b;
}

int makeOne(int N, int *data){
	if (N == 1)
		return 0;
	if (N == 2)
		return 1;
	if (data[N] != 0)
		return data[N];
	else {
		if (N % 2 == 0 && N % 3 == 0){
			data[N] = min3(makeOne(N / 2, data) + 1, makeOne(N / 3, data) + 1, makeOne(N - 1, data) + 1);
			return data[N];
		} else if (N % 2 == 0 && N % 3 != 0){
			data[N] = min2(makeOne(N / 2, data) + 1, makeOne(N - 1, data) + 1);
			return data[N];
		} else if (N % 2 != 0 && N % 3 == 0){
			data[N] = min2(makeOne(N / 3, data) + 1, makeOne(N - 1, data) + 1);
			return data[N];
		} else if (N % 2 != 0 && N % 3 != 0){
			data[N] = makeOne(N - 1, data) + 1;
			return data[N];
		}
	}
	return 0;
}

int main (){
	int data[1000001] = {0 ,};
	int N;

	scanf("%d", &N);
	printf("%d", makeOne(N, data));
}
