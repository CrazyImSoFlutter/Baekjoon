#include <iostream>
#include <string>
#include <climits>
#define MIN(x, y) (x < y ? x : y)

using namespace std;

const string white[] = {
    "WBWBWBWB",
    "BWBWBWBW",
    "WBWBWBWB",
    "BWBWBWBW",
    "WBWBWBWB",
    "BWBWBWBW",
    "WBWBWBWB",
    "BWBWBWBW"
};

const string black[] = {
    "BWBWBWBW",
    "WBWBWBWB",
    "BWBWBWBW",
    "WBWBWBWB",
    "BWBWBWBW",
    "WBWBWBWB",
    "BWBWBWBW",
    "WBWBWBWB"
};

int N, M, A;
string board[50];

void input() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> N >> M;
    for (int i = 0; i < N; i ++)
        cin >> board[i];
}

int check(int y, int x) {
    int w, b;

    w = b = 0;
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if (board[i + y][j + x] != white[i][j])
                w++;
        }
    }
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if (board[i + y][j + x] != black[i][j])
                b++;
        }
    }
    return MIN(w, b);
}

void solution() {
    A = INT_MAX;

    for (int i = 0; i <= N - 8; i++)
        for (int j = 0; j <= M - 8; j++)
            A = MIN(A, check(i, j));
    cout << A;
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
