#include <cstdio>
#include <queue>
#include <vector>
#include <utility>
#include <climits>

using namespace std;

int N, M, X, A;
int dist[1001];
vector<pair<int, int> > load[1001];

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
    bool operator()(pair<int, int> a, pair<int, int> b) {
        if (a.second != b.second)
            return a.second > b.second;
        return a.first > b.first;
    }
};

void input() {
    get(N), get(M), get(X);
    for (int i = 0; i < M; i++) {
        int from, to, cost;

        get(from), get(to), get(cost);
        load[from].push_back({to, cost});
    }
}

void init() {
    for (int i = 1; i <= N; i++) {
        dist[i] = INT_MAX;
    }
}

void solution(int start) {
    priority_queue<pair<int, int>, vector<pair<int, int> >, compare> Q;

    Q.push({start, 0});
    dist[start] = 0;
    while (!Q.empty()) {
        int node, cost;

        node = Q.top().first;
        cost = Q.top().second;
        Q.pop();
        if (dist[node] < cost)
            continue;
        for (int i = 0; i < load[node].size(); i++) {
            pair<int, int> next;

            next = load[node][i];
            if (cost + next.second < dist[next.first]) {
                dist[next.first] = cost + next.second;
                Q.push({next.first, cost + next.second});
            }
        }
    }
}

void solve() {
    int tmp;

    input();
    for (int i = 1; i <= N; i++) {
        init();
        solution(i);
        tmp = dist[X];
        init();
        solution(X);
        tmp += dist[i];
        A = A < tmp ? tmp : A;
    }
    printf("%d\n", A);
}

int main() {
    solve();
}
