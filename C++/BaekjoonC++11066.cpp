#include <cstdio>
#include <algorithm>
#include <limits.h>

using namespace std;

int T, N;
int dp[501][501];
int cost[501];
int sum[501];

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

int main() {
    get(T);
    while (T--) {
        get(N);
        for (int i = 1; i <= N; i++) {
            get(cost[i]);
            sum[i] = sum[i - 1] + cost[i];
        }
        for (int i = 1; i <= N; i++) {
            for (int j = 1; j + i <= N; ++j) {
                int k = j + i;

                dp[j][k] = INT_MAX;
                for (int l = j; l < k; l++) {
                    dp[j][k] = 
                        min(dp[j][k], dp[j][l] + dp[l + 1][k] + sum[k] - sum[j - 1]);
                }
            }
        }
        printf("%d\n", dp[1][N]);
    }
    return 0;
}

