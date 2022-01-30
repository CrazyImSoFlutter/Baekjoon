#include <cstdio>
#include <algorithm>
#include <utility>

using namespace std;

int N, M;
long long MAX_T;
long long T[10000];

void input() {
	scanf("%d %d", &N, &M);
	for (int i = 0; i < M; i++) {
		scanf("%lld", &T[i]);
		MAX_T = max(MAX_T, T[i]);
	}
}

void solution() {
	long long left, right;
	long long minute, temp;

	if (N <= M) {
		printf("%d\n", N);
		return ;
	}
	left = 1;
	right = MAX_T * N;
	minute = MAX_T * N;
	while (right > left) {
		long long mid, tmp;

		mid = (left + right) / 2;
		tmp = M;
		for (int i = 0; i < M; i++)
			tmp += (mid / T[i]);
		if (tmp < N)
			left = mid + 1;
		else {
			minute = min(minute, mid);
			right = mid;
		}
	}
	temp = M;
	for (int i = 0; i < M; i++)
		temp += ((minute - 1) / T[i]);
	for (int i = 0; i < M; i++) {
		if (minute % T[i] == 0) {
			++temp;
			if (temp == N) {
				printf("%d\n", i + 1);
				return ;
			}
		}
	}
}

void solve() {
	input();
	solution();
}

int main() {
	solve();
}
