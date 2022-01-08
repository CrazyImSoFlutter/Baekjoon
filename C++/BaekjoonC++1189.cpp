#include <iostream>

using namespace std;

int R, C, K, A;
char map[6][6];
bool visit[6][6];
int dy[] = {0, 0, -1, 1};
int dx[] = {-1, 1, 0, 0};

void input() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> R >> C >> K;
    for (int i = 0; i < R; i++) {
        cin >> map[i];
    }
}

bool check(int y, int x, int i) {
    if (y + dy[i] < 0 || y + dy[i] >= R || x + dx[i] < 0 || x + dx[i] >= C)
        return false;
    if (map[y + dy[i]][x + dx[i]] == 'T')
        return false;
    if (visit[y + dy[i]][x + dx[i]] == true)
        return false;
    return true;
}

void dfs(int y, int x, int depth) {
    if (depth == K - 1) {
        if (y == 0 && x == C - 1)
            A++;
        return;
    }
    visit[y][x] = true;
    for (int i = 0; i < 4; i++) {
        if (check(y, x, i)) {
            dfs(y + dy[i], x + dx[i], depth + 1);
        }
    }
    visit[y][x] = false;
}

void solve() {
    input();
    dfs(R - 1, 0, 0);
    cout << A;
}

int main() {
    solve();
}
