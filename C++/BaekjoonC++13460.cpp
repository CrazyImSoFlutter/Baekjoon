#include <iostream>
#include <string.h>
#define MIN(x, y) (x > y ? y : x)
using namespace std;

int N, M, answer;
int dy[] = {0, 0, -1, 1};
int dx[] = {-1, 1, 0, 0};
string map[10];
pair<int, int> R, B;

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> N >> M;
	for (int i = 0; i < N; i++) {
		cin >> map[i];
		for (int j = 0; j < M; j++) {
			if (map[i][j] == 'R') {
				R.first = i;
				R.second = j;
				map[i][j] = '.';
			} else if (map[i][j] == 'B') {
				B.first = i;
				B.second = j;
				map[i][j] = '.';
			}
		}
	}
	answer = 1000000000;
}

int inverse_direction(int cur) {
	if (cur == 0)
		return 1;
	else if (cur == 1)
		return 0;
	else if (cur == 2)
		return 3;
	else if (cur == 3)
		return 2;
	return 1;
}

void move(int rx, int ry, int bx, int by, int cnt, int dir) {
	bool R_flag, B_flag;
	int nrx, nry, nbx, nby;
	int R_dist, B_dist;

	if (cnt >= answer)
		return ;
	if (cnt > 10)
		return ;
	R_flag = false;
	B_flag = false;
	nry = ry + dy[dir];
	nrx = rx + dx[dir];
	while (true) {
		if (map[nrx][nry] == '#')
			break ;
		if (map[nrx][nry] == 'O') {
			R_flag = true;
			break ;
		}
		nrx += dx[dir];
		nry += dy[dir];
	}
	nry -= dy[dir];
	nrx -= dx[dir];

	nby = by + dy[dir];
	nbx = bx + dx[dir];
	while (true) {
		if (map[nbx][nby] == '#')
			break ;
		if (map[nbx][nby] == 'O') {
			B_flag = true;
			break ;
		}
		nbx += dx[dir];
		nby += dy[dir];
	}
	nby -= dy[dir];
	nbx -= dx[dir];

	if (B_flag == true)
		return ;
	else {
		if (R_flag == true) {
			answer = MIN(answer, cnt);
			return ;
		}
	}

	if (nrx == nbx && nry == nby) {
		R_dist = abs(rx - nrx) + abs(ry - nry);
		B_dist = abs(bx - nbx) + abs(by - nby);
		if (R_dist > B_dist) {
			nrx -= dx[dir];
			nry -= dy[dir];
		} else {
			nbx -= dx[dir];
			nby -= dy[dir];
		}
	}

	for (int i = 0; i < 4; i++) {
		if (i == dir)
			continue ;
		if (i == inverse_direction(dir))
			continue ;
		move(nrx, nry, nbx, nby, cnt + 1, i);
	}
}

void solution() {
	int x, y, nx, ny;

	for (int i = 0; i < 4; i++) {
		x = R.first;
		y = R.second;
		nx = B.first;
		ny = B.second;

		move(x, y, nx, ny, 1, i);
	}
	if (answer > 10 || answer == 1000000000)
		answer = -1;
	cout << answer << '\n';
}

void solve() {
	input();
	solution();
}

int main() {
	solve();
}
