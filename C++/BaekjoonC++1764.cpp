#include <iostream>
#include <unordered_map>
#include <vector>
#include <string>
#include <algorithm>

using namespace std;

int N, M;
unordered_map<string, int> list;
vector<string> ans;

void input() {
	int i;
	string tmp;

	cin >> N >> M;

	for (i = 0; i < N; i++) {
		cin >> tmp;
		list.insert({tmp, i});
	}

}

void solution() {
	int i;
	string tmp;

	for (i = 0; i < M; i++) {
		cin >> tmp;
		if (list.find(tmp) != list.end()) {
			ans.push_back(list.find(tmp)->first);
		}
	}
	sort(ans.begin(), ans.end());
	cout << ans.size() << "\n";
	for (i = 0; i < ans.size(); i++) {
		cout << ans[i] << "\n";
	}
}

void solve() {
	input();
	solution();
}

int main() {
	solve();
}
