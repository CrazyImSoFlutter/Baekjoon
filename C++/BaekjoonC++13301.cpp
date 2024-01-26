#include <iostream>

using namespace std;

long long dp[50];

long long fiboA(int n) {
    if (dp[n] != 0) {
        return dp[n];
    } else {
        dp[n] = fiboA(n - 1) + fiboA(n - 2);
        return dp[n];
    }
}

int N;

int main() {
    dp[1] = 4;
    dp[2] = 6;

    cin >> N;

    cout << fiboA(N);
}