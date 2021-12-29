#include <iostream>

using namespace std;

int N;

void stars_1(int n) {
    if (n == N)
        return;
    for (int i = 0; i < N - n; i++) {
        cout << ' ';
    }
    for (int i = 0; i < n * 2 - 1; i++) {
        cout << '*';
    }
    cout << '\n';
    stars_1(n + 1);
}

void stars_2(int n) {
    if (n <= 0)
        return;
    for (int i = 0; i < (2 * N - 1 - n) / 2; i++) {
        cout << ' ';
    }
    for (int i = 0; i < n; i++) {
        cout << '*';
    }
    cout << '\n';
    stars_2(n - 2);
}

int main() {
    cin >> N;
    stars_1(1);
    stars_2(2 * N - 1);
}

