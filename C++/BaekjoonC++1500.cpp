#include <stdio.h>

using namespace std;

int S, K;
long long sum;
int A[20];

int main() {
	scanf("%d %d", &S, &K);
	
	for (int i = 0; i < K; i++)
		A[i] = S / K;

	sum = 1;
	for (int i = 0; i < S % K; i++)
		A[i]++;

	for (int i = 0; i < K; i++)
		sum *= A[i];

	printf("%lld", sum);
}
