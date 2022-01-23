#include <iostream>
#define MAX(x, y) (x > y ? x : y)
using namespace std;

int N, M;
int map[50][50];
int dp[50][50];
bool visit[50][50];

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> N >> M;
	for (int i = 0; i < N; i++) {
		string s;

		cin >> s;
		for (int j = 0; j < s.length(); j++) {
			if (s[j] == 'H')
				map[i][j] = 0;
			else
				map[i][j] = s[j] - '0';
		}
	}
}

int solution(int y, int x) {
	if (y < 0 || y >= N || x < 0 || x >= M || map[y][x] == 0)
		return 0;

	if (visit[y][x] == true) {
		cout << -1 << '\n';
		exit(0);
	}

	if (dp[y][x] != 0)
		return dp[y][x];

	visit[y][x] = true;
	dp[y][x] = 0;
	dp[y][x] = MAX(solution(y - map[y][x], x) + 1, dp[y][x]);
	dp[y][x] = MAX(solution(y + map[y][x], x) + 1, dp[y][x]);
	dp[y][x] = MAX(solution(y, x - map[y][x]) + 1, dp[y][x]);
	dp[y][x] = MAX(solution(y, x + map[y][x]) + 1, dp[y][x]);
	visit[y][x] = false;
	return dp[y][x];
}

void solve() {
	input();
	cout << solution(0, 0) << endl;
}

int main() {
	solve();
}
