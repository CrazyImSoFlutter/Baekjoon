#include <iostream>
#include <cmath>

using namespace std;

int T;
long long x, y, n;

void input() {
	cin >> x >> y;
}

void solution() {
	n = (long long)sqrt((double)(y - x)) * 2 - 1;

    if ((y - x) == 1) {
        cout << 1 << '\n';
	} else if ((y - x) == (n + 1) / 2 * (n + 1) / 2) {
        cout << n << '\n';
    } else if ((y - x) > (n + 1) / 2 * (n + 1) / 2 && (y - x) <= ((n + 1) / 2 + 1) * (n + 1) / 2) {
        n += 1;
        cout << n << '\n';
    } else if ((y - x) > ((n + 1) / 2 + 1) * (n + 1) / 2) {
        n += 2;
        cout << n << '\n';
    }
}

void solve() {
	cin >> T;
	for (int i = 0; i < T; i++) {
		input();
		solution();
	}
}

int main() {
	solve();
}
