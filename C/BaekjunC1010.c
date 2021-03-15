#include <stdio.h>

double facto(int n){
	if (n == 0)
		return 1;
	return n * facto(n - 1);
}

int main(){
	int T, N, M;
	double answer = 0;
	scanf("%d", &T);
	for (int i = 0; i < T; i++){
		scanf("%d%d", &N, &M);
		answer = (facto(M) / facto(M - N)) / facto(N);
		printf("%.lf\n", answer);
	}
}
