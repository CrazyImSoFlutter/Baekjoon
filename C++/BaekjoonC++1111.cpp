#include <iostream>

using namespace std;

int N;
int A[51];

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> N;
	for (int i = 0; i < N; i++)
		cin >> A[i];
}

void solution() {
	if (N == 1)
		cout << "A\n";
	else if (N == 2)
		A[0] == A[1] ? cout << A[0] << '\n' : cout << "A\n";
	else if (N >= 3) {
		if (A[0] == A[1]) {
			for (int i = 2; i < N; i++) {
				if (A[i] != A[0]) {
					cout << "B\n";
					return ;
				}
			}
			cout << A[0] << '\n';
		} else {
			if ((A[2] - A[1]) % (A[1] - A[0]) != 0) {
				cout << "B\n";
				return ;
			} else {
				int a, b;

				a = (A[2] - A[1]) / (A[1] - A[0]);
				b = A[1] - A[0] * a;
				for (int i = 0; i < N - 1; i++) {
					if (A[i] * a + b != A[i + 1]) {
						cout << "B\n";
						return ;
					}
				}
				cout << a * A[N - 1] + b << '\n';
			}
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
