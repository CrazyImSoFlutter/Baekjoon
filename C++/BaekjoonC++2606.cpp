#include <stdio.h>
#include <queue>

using namespace std;

int graph[101][101];
int visit[101];
int V, E, answer;

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
    get(V); get(E);
    for (int i = 0; i < E; i++) {
        int a, b;

        get(a); get(b);
        graph[a][b] = 1;
        graph[b][a] = 1;
    }
}

void bfs(int x) {
    queue<int> Q;

    Q.push(x);
    visit[x] = 1;
    while(Q.empty() == 0) {
        int cur = Q.front();

        Q.pop();
        for (int i = 1; i <= V; i++) {
            if (graph[cur][i] == 1 && visit[i] == 0) {
                Q.push(i);
                visit[i] = 1;
                answer++;
            }
        }
    }
}

void solve() {
    input();
    bfs(1);
    printf("%d\n", answer);
}

int main() {
    solve();
}
