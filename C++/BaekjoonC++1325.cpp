#include <cstdio>
#include <vector>
#include <queue>

using namespace std;

int N, M, MAX, visit[10001];
vector<int> PC[10001];
int answer[10001];

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
        PC[to].push_back(from);
    }
}

void init() {
    for (int i = 0; i <= N; i++)
        visit[i] = 0;
}

void bfs(int s) {
    queue<int> Q;
    int cnt;

    Q.push(s);
    visit[s] = 1;
    cnt = 0;
    while (Q.empty() == 0) {
        int cur;

        cur = Q.front();
        Q.pop();
        cnt++;
        for (int i = 0; i < PC[cur].size(); i++) {
            if (visit[PC[cur][i]] == 0) {
                visit[PC[cur][i]] = 1;
                Q.push(PC[cur][i]);
            }
        }
    }
    answer[s] = cnt;
    MAX = MAX < cnt ? cnt : MAX;
}

void solution() {
    for (int i = 1; i <= N; i++) {
        init();
        bfs(i);
    }
    for (int i = 1; i <= N; i++) {
        if (answer[i] == MAX)
            printf("%d ", i);
    }
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
