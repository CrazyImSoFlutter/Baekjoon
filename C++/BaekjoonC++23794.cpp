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
    for (int i = 0; i < N + 2; i++)
        cout << '@';
    cout << '\n';
    for (int i = 0; i < N; i++) {
        cout << '@';
        for (int j = 0; j < N; j++) {
            cout << ' ';
        }
        cout << "@\n";
    }
    for (int i = 0; i < N + 2; i++)
        cout << '@';
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
