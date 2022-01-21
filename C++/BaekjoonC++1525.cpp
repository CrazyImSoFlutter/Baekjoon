#include <iostream>
#include <queue>
#include <string>
#include <map>
#include <algorithm>

using namespace std;

int start;
int dy[] = {0, 0, -1, 1};
int dx[] = {-1, 1, 0, 0};

void input() {
	int n;

	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	for (int i = 0; i < 9; i++) {
		cin >> n;
		if (n == 0)
			n = 9;
		start = start * 10 + n;
	}
}

int solution(int start) {
	int cnt;
	queue<int> Q;
	map<int, int> dist;

	Q.push(start);
	dist[start] = 0;
	while (!Q.empty()) {
		int cur, x, y, z;
		string cur_s;

		cur = Q.front();
		Q.pop();
		cur_s = to_string(cur);
		z = cur_s.find('9');
		y = z / 3;
		x = z % 3;
		for (int i = 0; i < 4; i++) {
			int ny, nx, next_idx, next;
			string tmp;

			ny = y + dy[i];
			nx = x + dx[i];
			if (ny < 0 || ny >= 3 || nx < 0 || nx >= 3)
				continue ;
			next_idx = ny * 3 + nx;
			tmp = cur_s;
			swap(tmp[z], tmp[next_idx]);
			next = stoi(tmp);
			if (dist.count(next) == 0) {
				Q.push(next);
				dist[next] = dist[cur] + 1;
			}
		}
	}
	if (dist.count(123456789) == 0)
		return -1;
	else
		return dist[123456789];
}

void solve() {
	input();
	cout << solution(start) << '\n';
}

int main() {
	solve();
}
