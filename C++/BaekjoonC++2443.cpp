#include <iostream>

using namespace std;

int N;

void stars(int n) {
    if (n <= 0)
        return;
    for (int i = 0; i < (2 * N - 1 - n) / 2; i++) {
        cout << ' ';
    }
    for (int i = 0; i < n; i++) {
        cout << '*';
    }
    cout << '\n';
    stars(n - 2);
}

int main() {
    cin >> N;
    stars(2 * N - 1);
}
