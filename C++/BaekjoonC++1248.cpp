#include <iostream>

using namespace std;

int N;
int S[10];
char R[10][10];

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> N;
	for (int i = 0; i < N; i++) {
		for (int j = i; j < N; j++)
			cin >> R[i][j];
	}
}

bool check(int index) {
	int sum;

	sum = 0;
	for (int i = index; i >= 0; i--) {
		sum += S[i];
		if (R[i][index] == '+' && sum <= 0)
			return false;
		if (R[i][index] == '-' && sum >= 0)
			return false;
		if (R[i][index] == '0' && sum != 0)
			return false;
	}
	return true;
}

void solution(int depth) {
	if (depth == N) {
		for (int i = 0; i < N; i++)
			cout << S[i] << ' ';
		cout << '\n';
		exit(0);
	}
	for (int i = -10; i <= 10; i++) {
		S[depth] = i;
		if (check(depth) == true)
			solution(depth + 1);
	}
}

void solve() {
	input();
	solution(0);
}

int main() {
	solve();
}
