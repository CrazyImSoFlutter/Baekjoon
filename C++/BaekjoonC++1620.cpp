#include <iostream>
#include <string>
#include <unordered_map>

using namespace std;

int N, M;
string P1[100001];
unordered_map<string, int> P2;

void input() {
	string tmp;

	cin.tie(NULL);
	ios_base::sync_with_stdio(false);
	cin >> N >> M;
	for (int i = 1; i <= N; i++) {
		cin >> tmp;
		P1[i] = tmp;
		P2.insert({tmp, i});
	}
}

void solution() {
	string tmp;

	for (int i = 0; i < M; i++) {
		unordered_map<string, int>::iterator iter;

		cin >> tmp;
		iter = P2.find(tmp);
		if (iter != P2.end()) {
			cout << iter->second << "\n";
		} else {
			cout << P1[stoi(tmp)] << "\n";
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
