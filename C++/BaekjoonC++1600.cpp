#include <cstdio>
#include <queue>
#include <utility>

using namespace std;

int W, H, K;
int map[200][200];
bool visit[200][200][31];
int dy[] = {0, 0, -1, 1};
int dx[] = {-1 ,1, 0, 0};
int ky[] = {-2, -1, 1, 2, 2, 1, -1, -2};
int kx[] = {1, 2, 2, 1, -1, -2, -2, -1};

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
    get(K); get(W); get(H);
    for (int i = 0; i < H; i++)
        for (int j = 0; j < W; j++)
            get(map[i][j]);
}

void solution() {
    queue<pair<pair<int, int>, pair<int, int> > > Q;

    Q.push({{0, 0}, {0, 0}});
    visit[0][0][0] = true;
    while (!Q.empty()) {
        int y, x, cnt, ability;

        y = Q.front().first.first;
        x = Q.front().first.second;
        cnt = Q.front().second.first;
        ability = Q.front().second.second;
        Q.pop();
        if (y == H - 1 && x == W - 1) {
            printf("%d\n", cnt);
            return ;
        }
        
        if (ability < K) {
            for (int i = 0; i < 8; i++) {
                int ny, nx;

                ny = y + ky[i];
                nx = x + kx[i];
                if (ny < 0 || nx < 0 || ny >= H || nx >= W)
                    continue;
                if (map[ny][nx] == 0 && visit[ny][nx][ability + 1] == false) {
                    visit[ny][nx][ability + 1] = true;
                    Q.push({{ny, nx}, {cnt + 1, ability + 1}});
                }
            }
        }
        for (int i = 0; i < 4; i++) {
            int ny, nx;
            
            ny = y + dy[i];
            nx = x + dx[i];
            if (ny < 0 || nx < 0 || ny >= H || nx >= W)
                continue;
            if (map[ny][nx] == 0 && visit[ny][nx][ability] == false) {
                visit[ny][nx][ability] = true;
                Q.push({{ny, nx}, {cnt + 1, ability}});
            }
        }
    }
    printf("-1\n");
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
