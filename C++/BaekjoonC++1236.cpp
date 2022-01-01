#include <iostream>

using namespace std;

char C[50][50];
int row[50];
int col[50];
int N, M, r, c;

void input() {
    cin >> N >> M;
    for (int i = 0; i < N; i++)
        cin >> C[i];
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            if (C[i][j] == 'X') {
                row[i] = 1;
                col[j] = 1;
            }
        }
    }
}

void solution() {
    for (int i = 0; i < N; i++)
        if (row[i] == 0)
            r++;
    for (int i = 0; i < M; i++)
        if (col[i] == 0)
            c++;
    cout << (r < c ? c : r);
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
