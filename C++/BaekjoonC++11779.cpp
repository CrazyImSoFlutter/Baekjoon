#include <cstdio>
#include <queue>
#include <vector>
#include <climits>

using namespace std;

int N, M, from, to;
int route[1001];
int dist[1001];
vector<int> answer;
vector<pair<int, int> > bus[1001];

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
	bool operator() (pair<int, int> a, pair<int, int> b) {
		if (a.second != b.second)
			return a.second > b.second;
		else
			return true;
	}
};

void input() {
	int f, t, c;

	get(N), get(M);
	for (int i = 0; i < M; i++) {
		get(f), get(t), get(c);
		bus[f].push_back({t, c});
	}
	get(from), get(to);
	for (int i = 1; i <= N; i++)
		dist[i] = INT_MAX;
}

void solution() {
	priority_queue<pair<int, int>, vector<pair<int, int> >, compare> Q;

	Q.push({from, 0});
	dist[from] = 0;
	while (!Q.empty()) {
		int cur_node;
		int cur_cost;

		cur_node = Q.top().first;
		cur_cost = Q.top().second;
		Q.pop();
		if (dist[cur_node] < cur_cost)
			continue ;
		for (int i = 0; i < bus[cur_node].size(); i++) {
			int next_node;
			int next_cost;

			next_node = bus[cur_node][i].first;
			next_cost = bus[cur_node][i].second;
			if (cur_cost + next_cost < dist[next_node]) {
				route[next_node] = cur_node;
				dist[next_node] = cur_cost + next_cost;
				Q.push({next_node, dist[next_node]});
			}
		}
	}
}

void solve() {
	int index;

	input();
	solution();
	printf("%d\n", dist[to]);
	index = to;
	while (index) {
		answer.push_back(index);
		index = route[index];
	}
	printf("%lu\n", answer.size());
	for (int i = answer.size() - 1; i >= 0; i--)
		printf("%d ", answer[i]);
}

int main() {
	solve();	
}
