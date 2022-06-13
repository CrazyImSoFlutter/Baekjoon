#include <iostream>
#include <vector>
#include <utility>
#include <map>

using namespace std;

pair<int, int> S, E, Q;
map<string, pair<int, int>> C;

void input() {
	string tmp;

	cin >> tmp;
	S = make_pair(stoi(tmp.substr(0, 2)), stoi(tmp.substr(3, 2)));
	cin >> tmp;
	E = make_pair(stoi(tmp.substr(0, 2)), stoi(tmp.substr(3, 2)));
	cin >> tmp;
	Q = make_pair(stoi(tmp.substr(0, 2)), stoi(tmp.substr(3, 2)));
	cin.ignore();
	while (getline(cin, tmp)) {
		pair<int, int> t;
		string name;

		t = make_pair(stoi(tmp.substr(0, 2)), stoi(tmp.substr(3, 2)));
		name = tmp.substr(6);
		if (C.find(name) == C.end()) {
			if (t.first < S.first) {
				m.insert({name, t});
			} else (t.first )
		}
		else {
			if ((t.first >= E.first && t.second >= E.second) &&
				(t.first <= Q.first && t.second <= Q.second))
		}

		C.push_back(make_pair(t, tmp.substr(6)));
	}
}

void solution() {
	
}

void solve() {
	input();
	solution();
}

int main() {
	solve();
}
