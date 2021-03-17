#include <stdio.h>

int main (){
	int N;
	int k[5];
	long long facto = 1;

	scanf("%d", &N);
	for (int i = 1; i <= N; i++){
		facto *= i;
		while (facto % 10 == 0){
			facto /= 10;
		}
        facto %= 100000000000;
	}	
	for (int i = 0; i < 5; i++){
		k[i] = facto % 10;
		facto /= 10;
	}
	for (int i = 4; i >= 0; i--){
		printf("%d", k[i]);
	}
}
