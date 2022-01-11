#include <iostream>

using namespace std;

int N;

void input() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> N;
}

void solution() {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < 5; j++) {
            char tmp;

            if (j == 3)
                tmp = ' ';
            else
                tmp = '@';
            for (int k = 0; k < N; k++) {
                cout << tmp;
            }
        }
        cout << '\n';
    }
    for (int i = 0; i < N * 3; i++) {
        for (int j = 0; j < 5; j++) {
            char tmp;

            if (j % 2 == 0)
                tmp = '@';
            else
                tmp = ' ';
            for (int k = 0; k < N; k++) {
                cout << tmp;
            }
        }
        cout << '\n';
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < 5; j++) {
            char tmp;

            if (j == 1)
                tmp = ' ';
            else
                tmp = '@';
            for (int k = 0; k < N; k++) {
                cout << tmp;
            }
        }
        cout << '\n';
    }
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
