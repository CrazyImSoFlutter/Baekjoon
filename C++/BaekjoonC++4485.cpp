#include <cstdio>
#include <queue>
#include <climits>
#include <vector>
#include <utility>
#include <tuple>

using namespace std;

int N;
int map[126][126];
int dist[126][126];
int dy[] = {-1, 1, 0, 0};
int dx[] = {0, 0, -1, 1};

inline void get(int& x) {
	int c = getchar_unlocked();

	x = 0;
	int neg = 0;
	for (; ((c < 48 || c > 57) && c != '-'); c = getchar_unlocked());
	if (c == '-') {
		neg = 1;
		c = getchar_unlocked();
	}
	for (; c > 47 && c < 58; c = getchar_unlocked()) {
		x = (x << 1) + (x << 3) + c - 48;
	}
	if (neg)
		x = -x;
}

struct compare {
	bool operator()(tuple<int, int, int> a, tuple<int, int, int> b) {
		if (get<2>(a) != get<2>(b))
			return get<2>(a) > get<2>(b);
		else
			return true;
	}
};

int input() {
	get(N);
	if (N == 0)
		return -1;
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			get(map[i][j]);
			dist[i][j] = INT_MAX;
		}
	}
	return 0;
}

void solution(int i) {
	priority_queue<tuple<int, int, int>, vector<tuple<int, int, int> >, compare> Q;

	Q.push({0, 0, map[0][0]});
	dist[0][0] = map[0][0];
	while (!Q.empty()) {
		int cur_y, cur_x, cur_cost;

		cur_y = get<0>(Q.top());
		cur_x = get<1>(Q.top());
		cur_cost = get<2>(Q.top());
		Q.pop();
		if (dist[cur_y][cur_x] < cur_cost)
			continue ;
		for (int i = 0; i < 4; i++) {
			int next_y, next_x;

			next_y = cur_y + dy[i];
			next_x = cur_x + dx[i];
			if (next_y < 0 || next_y >= N || next_x < 0 || next_x >= N)
				continue ;
			if (cur_cost + map[next_y][next_x] < dist[next_y][next_x]) {
				dist[next_y][next_x] = cur_cost + map[next_y][next_x];
				Q.push({next_y, next_x, cur_cost + map[next_y][next_x]});
			}
		}
	}
	printf("Problem %d: %d\n", i, dist[N - 1][N - 1]);
}

void solve() {
	int i;

	i = 0;
	while (++i) {
		if (input() == -1)
			return ;
		solution(i);
	}
}

int main() {
	solve();
}
