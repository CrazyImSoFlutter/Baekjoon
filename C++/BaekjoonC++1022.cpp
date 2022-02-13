#include <iostream>
#include <algorithm>

using namespace std;

int r1, r2, c1, c2, len;

int get_length(int n) {
	int ret;

	ret = 0;
	while (n) {
		n /= 10;
		ret++;
	}
	return ret;
}

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> r1 >> c1 >> r2 >> c2;
	len = 0;
}

int solution(int i, int j) {
	int line, vertex, sub;

	line = max(abs(i), abs(j));
	vertex = 2 * line + 1;
	vertex *= vertex;
	sub = 2 * line;

	if (i == line)
		return vertex - (line - j);
	vertex -= sub;
	if (j == -line)
		return vertex - (line - i);
	vertex -= sub;
	if (i == -line)
		return vertex - (line + j);
	vertex -= sub;
	return vertex - (line + i);
}

void solve() {
	input();
	for (int i = r1; i <= r2; i++)
		for (int j = c1; j <= c2; j++)
			len = max(len, get_length(solution(i, j)));


	for (int i = r1; i <= r2; i++) {
		for (int j = c1; j <= c2; j++) {
			cout.width(len);
			cout.fill(' ');
			cout << solution(i, j) << ' ';
		}
		cout << '\n';
	}
}

int main() {
	solve();
}
