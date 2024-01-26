#include<iostream>
#define DIV 1000000000

using namespace std;

int N, K, DP[210][210];

int main() {
    cin >> N >> K;

    for (int i = 0; i <= N; i++) {
        DP[1][i] = 1;
    }

    for (int i = 0; i <= K; i++) {
        DP[i][0] = 1;
    }

    for (int i = 1; i <= N; i++) {
        for (int j = 2; j <= K; j++) {
            DP[j][i] = ((DP[j - 1][i] % DIV) + (DP[j][i - 1] % DIV)) % DIV;
        }
    }
    cout << DP[K][N];
}