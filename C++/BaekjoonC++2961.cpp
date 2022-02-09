#include <iostream>
#include <cmath>
#include <climits>

using namespace std;

int N;
int S[11];
int B[11];
bool V[11];
int	A[10];
int answer;

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> N;
	for (int i = 0; i < N; i++) {
		cin >> S[i] >> B[i];
	}
	answer = INT_MAX;
}

void solution(int depth, int max_depth) {
	int SS, BS;

	if (depth == max_depth) {
		SS = 1;
		BS = 0;
		for (int i = 0; i < max_depth; i++) {
			SS *= S[A[i]];
			BS += B[A[i]];
		}
		answer = answer > abs(SS - BS) ? abs(SS - BS) : answer;
		return ;
	}
	for (int i = 0; i < N; i++) {
		if (V[i] == false) {
			V[i] = true;
			A[depth] = i;
			solution(depth + 1, max_depth);
			V[i] = false;
		}
	}
}

void solve() {
	input();
	for (int i = 1; i <= N; i++)
		solution(0, i);
	cout << answer;
}

int main() {
	solve();
}
