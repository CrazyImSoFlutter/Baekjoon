#include <iostream>
#include <set>
#include <string>

using namespace std;

string str;
set<string> string_set;

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(0);
	cin >> str;
}

void solution() {
	string tmp = "";

	for (int i = 0; i < str.size(); i++) {
		for (int j = i; j < str.size(); j++) {
			tmp += str[j];
			string_set.insert(tmp);
		}
		tmp = "";
	}
}

void solve() {
	input();
	solution();
	cout << string_set.size();
}

int main() {
	solve();
}
