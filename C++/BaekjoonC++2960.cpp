#include <iostream>

using namespace std;

int N, K, num[1001];

void input() {
    cin >> N >> K;
}

int solution() {
    int count;

    count = 0;
    for (int i = 2; i <= N; i++) {
        for (int j = i; j <= N; j += i) {
            if (num[j] == 1)
                continue ;
            num[j] = 1;
            count++;
            if (count == K)
                return j;
        }
    }
    return 0;
}

void solve() {
    input();
    cout << solution();
}

int main() {
    solve();
}
