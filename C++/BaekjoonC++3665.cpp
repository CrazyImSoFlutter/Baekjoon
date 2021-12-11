#include <cstdio>
#include <vector>
#include <queue>

using namespace std;

int T, N, M;
int graph[501][501];
int score[501];
int result[501];
int degree[501];

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
    get(N);
    for (int i = 1; i <= N; i++) {
        get(score[i]);
        result[i] = 1;
        degree[i] = 0;
        for (int j = 1; j <= N; j++) {
            graph[i][j] = 0;
        }
    }
    for (int i = 1; i <= N; i++) {
        int s;

        s = score[i];
        for (int j = i + 1; j <= N; j++) {
            graph[s][score[j]] = 1;
            degree[score[j]]++;
        }
    }

    get(M);
    for (int i = 0; i < M; i++) {
        int src, dst;

        get(src); get(dst);
        if (graph[src][dst] == 1) {
            graph[src][dst] = 0;
            graph[dst][src] = 1;
            degree[dst]--;
            degree[src]++;
        } else {
            graph[dst][src] = 0;
            graph[src][dst] = 1;
            degree[src]--;
            degree[dst]++;
        }
    }
}

void topology() {
    queue<int> Q;
    for (int i = 1; i <= N; i++) {
        if (degree[i] == 0)
            Q.push(i);
    }
    for (int i = 1; i <= N; i++) {
        int cur;

        if (Q.empty()) {
            printf("IMPOSSIBLE\n");
            return ;
        }
        if (Q.size() > 1) {
            printf("?\n");
            return ;
        }
        cur = Q.front();
        result[i] = cur;
        Q.pop();
        degree[cur]--;
        for (int j = 1; j <= N; j++) {
            if (graph[cur][j])
                degree[j]--;
            if (degree[j] == 0)
                Q.push(j);
        }
    }
    for (int i = 1; i <= N; i++) {
        printf("%d ", result[i]);
    }
    printf("\n");
}

void solve() {
    get(T);

    for (int i = 0; i < T; i++) {
        input();
        topology();
    }
}

int main() {
    solve();
}
