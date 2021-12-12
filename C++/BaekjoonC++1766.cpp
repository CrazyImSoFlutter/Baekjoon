#include <cstdio>
#include <queue>
#include <vector>

using namespace std;

int N, M;
int degree[32001];
int result[32001];
vector<int> problem[32001];

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

void input() {
    get(N); get(M);

    for (int i = 0; i < M; i++) {
        int from, to;

        get(from); get(to);
        problem[from].push_back(to);
        degree[to]++;
    }
}

void topology() {
    priority_queue<int, vector<int>, greater<int> > Q;
    for (int i = 1; i <= N; i++) {
        if (degree[i] == 0)
            Q.push(i);
    }

    for (int i = 1; i <= N; i++) {
        int cur;

        if (Q.empty())
            return ;
        cur = Q.top();
        Q.pop();
        result[i] = cur;
        for (int j = 0; j < problem[cur].size(); j++) {
            if (--degree[problem[cur][j]] == 0)
                Q.push(problem[cur][j]);
        }
    }
    for (int i = 1; i <= N; i++) {
        printf("%d ", result[i]);
    }
}

void solve() {
    input();
    topology();
}

int main() {
    solve();
}
