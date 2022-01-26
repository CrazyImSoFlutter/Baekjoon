#include <iostream>
#include <queue>
#include <utility>
#define PP pair<pair<int, int>, pair<int, int> > 
using namespace std;

int dy[] = {0, 0, -1, 1};
int dx[] = {-1, 1, 0, 0};
char map[50][50];
char dist[50][50];
int N, M;
pair<int, int> S, F;

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> N >> M;
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < M; j++) {
			cin >> map[i][j];
			if (map[i][j] == 'S')
				S = {i, j};
			else if (map[i][j] == 'F')
				F = {i, j};
			dist[i][j] = -1;
		}
	}
}

void solution() {
	priority_queue<PP, vector<PP>, greater<PP> > Q;
	pair<int, int> answer;
	
	Q.push({{0, 0}, {S.first, S.second}});
	dist[S.first][S.second] = 0;
	answer = {0, 0};
	while (!Q.empty()) {
		int gc, gnc, y, x;
		bool check;

		gc = Q.top().first.first;
		gnc = Q.top().first.second;
		y = Q.top().second.first;
		x = Q.top().second.second;
		Q.pop();
		check = false;
		
		for (int i = 0; i < 4; i++) {
			int ny, nx, ngc, ngnc;

			ny = y + dy[i];
			nx = x + dx[i];
			ngc = gc;
			ngnc = gnc;
			if (ny == F.first && nx == F.second) {
				answer = {ngc, ngnc};
				check = true;
				break ;
			}
			if (ny < 0 || ny >= N || nx < 0 || nx >= M)
				continue ;
			if (dist[ny][nx] != -1)
				continue ;
			if (map[ny][nx] == 'g')
				Q.push({{ngc + 1, ngnc}, {ny, nx}});
			else if (map[ny][nx] == '.') {
				bool flag;

				flag = false;
				for (int i = 0; i < 4; i++) {
					if (map[ny + dy[i]][nx + dx[i]] == 'g')
						flag = true;
				}
				if (flag)
					ngnc++;
				Q.push({{ngc, ngnc}, {ny, nx}});
			}
			dist[ny][nx] = dist[y][x] + 1;
		}
		if (check)
			break ;
	}
	cout << answer.first << ' ' << answer.second << '\n';
}

void solve() {
	input();
	solution();
}

int main() {
	solve();
}
