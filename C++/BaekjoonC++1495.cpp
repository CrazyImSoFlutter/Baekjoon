#include <iostream>
using namespace std;

int change, N, S, M, V[51];
int DP[51][1001];

int main() {
    cin >> N >> S >> M;

    for (int i = 1; i <= N; i++) {
        cin >> V[i];
    }

    DP[0][S] = 1;
    for (int i = 1; i <= N; i++) {
        for (int j = 0; j <= M; j++) {
            if (DP[i - 1][j]) {
                change = j + V[i];
                if (change <= M) {
                    DP[i][change] = 1;
                }

                change = j - V[i];
                if (change >= 0) {
                    DP[i][change] = 1;
                }
            }
        }
    }

    for (int i = M; i >= 0; i--) {
        if (DP[N][i]) {
            cout << i << '\n';
            return 0;
        }
    }
    cout << -1 << '\n';
}