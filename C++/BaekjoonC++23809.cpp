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
        for (int j = 0; j < N * 5; j++) {
            char tmp;

            if (j / N == 0 || j / N == 4)
                tmp = '@';
            else
                tmp = ' ';
            cout << tmp;
        }
        cout << '\n';
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N * 4; j++) {
            char tmp;

            if (j / N == 0 || j / N == 3)
                tmp = '@';
            else
                tmp = ' ';
            cout << tmp;
        }
        cout << '\n';
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N * 3; j++) {
            cout << '@';
        }
        cout << '\n';
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N * 4; j++) {
            char tmp;

            if (j / N == 0 || j / N == 3)
                tmp = '@';
            else
                tmp = ' ';
            cout << tmp;
        }
        cout << '\n';
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N * 5; j++) {
            char tmp;

            if (j / N == 0 || j / N == 4)
                tmp = '@';
            else
                tmp = ' ';
            cout << tmp;
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
