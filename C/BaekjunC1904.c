#include <stdio.h>

long long tile(int N, long long *data){
    if (N == 0)
        return 0;
	if (N == 1)
		return 1;
	if (N == 2)
		return 2;
	if (data[N] != 0)
		return data[N];
	else {
		data[N] = tile(N-1, data) % 15746 + tile(N-2, data) % 15746;
		return data[N];
	}
}

int main() {
    long long data[1000001] = {0, };
	int N;

	scanf("%d", &N);
	printf("%lld", tile(N, data) % 15746);
}
