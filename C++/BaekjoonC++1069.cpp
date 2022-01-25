#include <iostream>
#include <cmath>
#include <algorithm>
#define MIN(x, y)(x < y ? x : y)

using namespace std;

double X, Y, D, T;

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> X >> Y >> D >> T;
}

void solution() {
	double dist, answer, tmp;
	int cnt;

	dist = sqrt(X * X + Y * Y);
	answer = dist;
	if (D / T < 1) {
		cout.precision(13);
		cout << answer << '\n';
		return ;
	}
	cnt = dist / D;
	answer = cnt * T;
	dist -= cnt * D;
	if (dist != 0) {
		if (cnt != 0)
			tmp = answer + T;
		else
			tmp = min(T * 2, D - dist + T);
		answer += dist;
		answer = min(answer, tmp);
	}
	cout.precision(13);
	cout << answer << '\n';
}

void solve() {
	input();
	solution();
}

int main() {
	solve();
}
