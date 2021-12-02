#include <stdio.h>
#include <vector>
#include <utility>
#include <queue>
#include <math.h>
#include <cstring>

using namespace std;

int N, L, R, answer;
int map[50][50];
int visit[50][50];
int dy[] = {0, 0, 1, -1};
int dx[] = {1, -1, 0, 0};
bool check = true;
vector<vector<pair<int,int> > > uni;

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

bool can_move(int y, int x) {
    for (int i = 0; i < 4; i++) {
        int yp = y + dy[i];
        int xp = x + dx[i];
        
        if (yp >= 0 && xp >= 0 && yp < N && xp < N) {
            int abs_value = abs(map[y][x] - map[yp][xp]);

            if (L <= abs_value && abs_value <= R)
                return true;
        }
    }
    return false;
}

bool can_union(int y1, int x1, int y2, int x2) {
    int abs_value = abs(map[y1][x1] - map[y2][x2]);

    if (L <= abs_value && abs_value <= R)
        return true;
    return false;
}

void BFS(int a, int b) {
    queue<pair<int, int>> Q, uni;
    int sum = 0;
    int cnt = 0;
    int new_value = 0;

    Q.push(make_pair(a, b));
    uni.push(make_pair(a, b));
    visit[a][b] = true;
    while (!Q.empty()) {
        int y = Q.front().first;
        int x = Q.front().second;

        Q.pop();
        sum += map[y][x];
        cnt++;
        for (int i = 0; i < 4; i++) {
            int yp = y + dy[i];
            int xp = x + dx[i];

            if (yp < 0 || xp < 0 || yp >= N || xp >= N) continue;
            if (visit[yp][xp]) continue;
            if (can_union(y, x, yp, xp)) {
                visit[yp][xp] = 1;
                Q.push(make_pair(yp, xp));
                uni.push(make_pair(yp, xp));
            }
        }
    }

    new_value = sum / cnt;

    while (!uni.empty()) {
        int y = uni.front().first;
        int x = uni.front().second;

        uni.pop();
        map[y][x] = new_value;
    }
}

int main() {
    get(N); get(L); get(R);
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            get(map[i][j]);
    
    while (check) {
        check = false;
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++)
                if (!visit[i][j] && can_move(i, j)) {
                    BFS(i, j);
                    check = true;
                }
        }
        if (check) answer++;
        memset(visit, false, sizeof(visit));
    }
    printf("%d", answer);
}
