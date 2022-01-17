#include <iostream>

using namespace std;

int SUM, DIF;

void input() {
	cin >> SUM >> DIF;
}

void solution() {
	int a, b;

	b = SUM / 2;
	a = SUM - b;
	while (b >= 0) {
		if (DIF == a - b) {
			cout << a << ' ' << b << '\n';
			return ;
		}
		a++;
		b--;
	}
	cout << -1 << '\n';
}

void solve() {
	input();
	solution();
}

int main() {
	solve();
}
