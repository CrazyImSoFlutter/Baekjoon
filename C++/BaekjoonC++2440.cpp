#include <iostream>

using namespace std;

int N;

void stars(int n) {
    if (n == 0)
        return;
    for (int i = 0; i < n; i++) {
        cout << '*';
    }
    cout << '\n';
    stars(n - 1);
}

int main() {
    cin >> N;
    stars(N);
}
