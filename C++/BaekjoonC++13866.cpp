#include <iostream>
#define MIN(x, y) (x > y ? y : x)

using namespace std;

int A[4];
int answer;
bool V[4];

void input() {
	cin >> A[0] >> A[1] >> A[2] >> A[3];
	answer = 100000;
}

void solution(int depth) {
	if (depth == 2) {
		int X, Y;

		X = 0;
		Y = 0;
		for (int i = 0; i < 4; i++) {
			if (V[i] == true) {
				X += A[i];
			} else {
				Y += A[i];
			}
		}
		answer = MIN(answer, abs(X - Y));
		return ;
	}
	for (int i = 0; i < 4; i++) {
		if (V[i] == true)
			continue ;
		V[i] = true;
		solution(depth + 1);
		V[i] = false;
	}
}

void solve() {
	input();
	solution(0);
	cout << answer << '\n';
}

int main() {
	solve();
}
