#include <cstdio>
#include <queue>
#include <utility>

using namespace std;

int N, M;
int G[300][300];
int tmp[300][300];
int visit[300][300];
int dy[] = {-1, 1, 0, 0};
int dx[] = {0, 0, -1, 1};
int flag;
int cnt;
int year;

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
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            get(G[i][j]);
        }
    }
}

void init() {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            visit[i][j] = 0;
            tmp[i][j] = 0;
        }
    }
}

void melt() {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            int cur;

            cur = G[i][j];
            if (cur == 0)
                continue;
            flag = 1;
            for (int k = 0; k < 4; k++) {
                if (i + dy[k] < 0 || j + dx[k] < 0 || i + dy[k] >= N || j + dx[k] >= M)
                    continue;
                if (G[i + dy[k]][j + dx[k]] == 0)
                    cur--;
                if (cur == 0) {
                    tmp[i][j] = cur;
                    break;
                }
            }
            tmp[i][j] = cur;
        }
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            G[i][j] = tmp[i][j];
        }
    }
}

void bfs(int y, int x) {
    queue<pair<int, int> > Q;
    
    Q.push(make_pair(y, x));
    visit[y][x] = 1;
    while (Q.empty() == 0) {
        int curY = Q.front().first;
        int curX = Q.front().second;

        Q.pop();
        for (int i = 0; i < 4; i++) {
            int Y = curY + dy[i];
            int X = curX + dx[i];

            if (Y < 0 || X < 0 || Y >= N || X >= M)
                continue;
            if (visit[Y][X] == 0 && G[Y][X] != 0) {
                Q.push(make_pair(Y, X));
                visit[Y][X] = 1;
            }
        }
    }
}

void solution() {
    while (true) {
        init();
        flag = 0;
        cnt = 0;
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < M; j++) {
                if (visit[i][j] == 0 && G[i][j] != 0) {
                    bfs(i, j);
                    cnt++;
                }
            }
        }
        if (cnt >= 2) {
            printf("%d", year);
            break;
        }   
        melt();
        if (flag == 0) {
            printf("%d", 0);
            break;
        }
        year++;
    }
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
