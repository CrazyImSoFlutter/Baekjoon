#include <cstdio>
#include <climits>
#define MIN(x, y) (x < y ? x : y)

using namespace std;

int N;
int r[501];
int c[501];
int dp[501][501];

inline void get(int& x) {
	int c = getchar_unlocked();

	x = 0;
	int neg = 0;
	for (; ((c < 48 || c > 57) && c != '-'); c = getchar_unlocked());
	if (c == '-') {
		neg = 1;
		c = getchar_unlocked();
	}
	for (; c > 47 && c < 58; c = getchar_unlocked()) {
		x = (x << 1) + (x << 3) + c - 48;
	}
	if (neg)
		x = -x;
}

void input() {
    get(N);
    for (int i = 0; i < N; i++) {
        get(r[i]); get(c[i]);
    }
}

void solution() {
    for (int d = 1; d < N; d++) {
        for (int i = 0; i < N - d; i++) {
            dp[i][i + d] = INT_MAX;
            for (int j = i; j < i + d; j++) {
                dp[i][i + d] = MIN(dp[i][i + d], dp[i][j] + dp[j + 1][i + d] + r[i] * r[j + 1] * c[i + d]);
            }
        }
    }
    printf("%d", dp[0][N - 1]);
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
