#include <stdio.h>
#include <algorithm>

using namespace std;

int N;
int	A[8];
int visit[8];
int arr[8];
int cnt;

void dfs(int n, int m, int depth);

int main() {
	scanf("%d", &N);
	for (int i = 0; i < N; i++)
		scanf("%d", &A[i]);
	dfs(N, N, 0);
	printf("%d", cnt);
}

void dfs(int n, int m, int depth) {
	if (depth == m) {
		int tmp = 0;
		int cumul = 0;

		for (int i = 0; i < m; i++) {
			int sum = 0;

			if (i != 0)
				cumul += arr[i - 1];
			for (int j = i; j < m; j++) {
				if (cumul == 50)
					break;
				sum += arr[j];
				if (sum == 50) {
					tmp++;
					break;
				} else if (sum > 50) {
					break;
				}
			}
		}
		cnt = max(tmp, cnt);
	}

	for (int i = 0; i < n; i++) {
		if (visit[i] == 0) {
			visit[i] = 1;
			arr[depth] = A[i];
			dfs(n, m, depth + 1);
			visit[i] = 0;
		}
	}
	return ;
}
