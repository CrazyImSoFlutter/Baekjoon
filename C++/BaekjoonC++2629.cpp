#include <iostream>
#include <algorithm>

using namespace std;

int N, M;
int W[31];
int B[8];
int DP[31][15001];

void input() {
    cin >> N;
    for (int i = 0; i < N; i++) {
        cin >> W[i];
    }
    cin >> M;
    for (int i = 0; i < M; i++) {
        cin >> B[i];
    }
}

void solution(int curW_count, int curW) {
    if (curW_count > N)
        return;
    if (DP[curW_count][curW] != 0)
        return;
    DP[curW_count][curW] = 1;
    solution(curW_count + 1, curW + W[curW_count]);
    solution(curW_count + 1, curW);
    solution(curW_count + 1, abs(curW - W[curW_count]));
}

void solve() {
    solution(0, 0);
    for (int i = 0; i < M; i++) {
        if (B[i] > 15000)
            cout << "N ";
        else if (DP[N][B[i]] == 1)
            cout << "Y ";
        else
            cout << "N ";
    }
}

int main() {
    input();
    solve();
}
