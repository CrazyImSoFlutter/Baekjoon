#include <iostream>
#include <map>
#include <string>

using namespace std;

int N, M, answer;
string s;
map<string, bool> m;

void input() {
	ios_base::sync_with_stdio(0);
	cin.tie(0);

	cin >> N >> M;
}

void solution() {
	for (int i = 0; i < N; i++) {
		cin >> s;
		m[s] = true;
	}
	for (int i = 0; i < M; i++) {
		cin >> s;
		if (m[s])
			answer++;
	}
}

void solve() {
	input();
	solution();
	cout << answer << "\n";
}

int main() {
	solve();
}
