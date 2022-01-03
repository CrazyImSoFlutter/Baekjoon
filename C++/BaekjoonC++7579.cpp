#include <cstdio>
#define MAX(x, y) (x > y ? x : y)


using namespace std;

int N, M, A, S;
int bite[101];
int cost[101];
int dp[101][10001];

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
    get(N); get(M);
    for (int i = 1; i <= N; i++)
        get(bite[i]);
    for (int i = 1; i <= N; i++) {
        get(cost[i]);
        S += cost[i];
    }
}

void solution() {
    for (int i = 1; i <= N; i++) {
        for (int j = 0; j <= S; j++) {
            if (j - cost[i] >= 0)
                dp[i][j] = MAX(dp[i][j], dp[i - 1][j - cost[i]] + bite[i]);
            dp[i][j] = MAX(dp[i][j], dp[i - 1][j]);
        }
    }
    for (int i = 0; i <= S; i++) {
        if (dp[N][i] >= M) {
            printf("%d", i);
            return;
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
