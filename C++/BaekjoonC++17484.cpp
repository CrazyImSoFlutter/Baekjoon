#include <iostream>
#include <utility>
#include <cstring>

using namespace std;

int N, M, map[7][7], dp[7][7][4];
int ans = 987654321;

int dfs(int y, int x, int prev) {
    if (y == N) {
        return 0;
    }

    int &ret = dp[y][x][prev];

    if (ret != -1) {
        return ret;
    }

    ret = 987654321;

    if (x - 1 >= 0 && prev != 0) {
        ret = min(ret, dfs(y + 1, x - 1, 0) + map[y][x]);
    }

    if (prev != 1) {
        ret = min(ret, dfs(y + 1, x, 1) + map[y][x]);
    }

    if (x + 1 < M && prev != 2) {
        ret = min(ret, dfs(y + 1, x + 1, 2) + map[y][x]);
    }

    return ret; 
}

int main() {
    cin >> N >> M;

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            cin >> map[i][j];
        }
    }

    memset(dp, -1, sizeof(dp));

    for (int i = 0; i < M; i++) {
        ans = min(ans, dfs(0, i, 3));
    }

    cout << ans;
}