#include <iostream>
#include <algorithm>

using namespace std;

int T, N, K, coins[101];


int main() {
    cin >> T;
    for (int i = 0; i < T; i++) {
        int DP[10001] = {0, };
        
        cin >> N;

        for (int i = 0; i < N; i++) {
            cin >> coins[i];
        }

        cin >> K;
        DP[0] = 1;

        for (int i = 0; i < N; i++) {
            for (int j = coins[i]; j <= K; j++) {
                DP[j] += DP[j - coins[i]];
            }
        }
        cout << DP[K] << '\n';
    }
}