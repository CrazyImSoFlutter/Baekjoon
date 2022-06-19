#include <iostream>
#include <string>

using namespace std;

int M, B;

void input() {
	ios::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> M;
}

void solution() {
	string cmd;
	int x;

	while (M--) {
		cin >> cmd;
		if (cmd == "add") {
			cin >> x;
			B |= (1 << x);
		} else if (cmd == "remove") {
			cin >> x;
			B &= ~(1 << x);
		} else if (cmd == "check") {
			cin >> x;
			if (B & (1 << x))
				cout << 1 << '\n';
			else
				cout << 0 << '\n';
		} else if (cmd == "toggle") {
			cin >> x;
			B ^= (1 << x);
		} else if (cmd == "all") {
			B = (1 << 21) - 1;
		} else if (cmd == "empty") {
			B = 0;
		}
	}
}

void solve() {
	input();
	solution();
}

int main() {
	solve();
}
