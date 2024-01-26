#include <iostream>
#include <algorithm>
#define INF 987654321

using namespace std;

int N, K, coins[101];
int DP[10001];

int main() {
    cin >> N >> K;

    for (int i = 0; i < N; i++) {
        cin >> coins[i];
    }
    for (int i = 1; i <= K; i++) {
        DP[i] = INF;
    }

    for (int i = 0; i < N; i++) {
        for (int j = coins[i]; j <= K; j++) {
            DP[j] = min(DP[j], DP[j - coins[i]] + 1);
        }
    }

    if (DP[K] == INF) {
        cout << -1;
    } else {
        cout << DP[K];
    }
}