#include <iostream>
#include <string>
#include <regex>

using namespace std;

int T;
string S;
regex P("(100+1+|01)+");

void input() {
	ios::sync_with_stdio(false);
	cin.tie(NULL);

	cin >> T;
}

void solution(string s) {
	cout << (regex_match(S, P) ? "YES\n" : "NO\n");
}

void solve() {
	input();
	for (int i = 0; i < T; i++) {
		cin >> S;
		solution(S);
	}
}

int main() {
	solve();
}
