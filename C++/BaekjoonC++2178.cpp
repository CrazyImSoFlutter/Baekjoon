#include <iostream>
#include <string>
#include <vector>
#include <queue>
#include <utility>

using namespace std;

int N, M;
int dy[] = {1, -1, 0, 0};
int dx[] = {0, 0, 1, -1};
vector<vector<int>> map;
vector<vector<int>> visited;
string tmp;

void input() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> N >> M;
    for (int i = 0; i < N; i++) {
        map.push_back(vector<int>(M));
        visited.push_back(vector<int>(M));
    }
    for (int i = 0; i < N; i++) {
        cin >> tmp;
        for (int j = 0; j < M; j++) {
            map[i][j] = tmp[j] - 48;
        }
    }
}

void solution() {
    queue<pair<int, int>> q;

    q.push({0, 0});
    visited[0][0] = 1;
    while (q.size() != 0) {
        pair<int, int> cur;

        cur = q.front();
        q.pop();
        for (int i = 0; i < 4; i++) {
            if (cur.first + dy[i] < 0 || cur.first + dy[i] >= N || cur.second + dx[i] < 0 || cur.second + dx[i] >= M) {
                continue ;
            }
            if (visited[cur.first + dy[i]][cur.second + dx[i]] != 0) {
                continue ;
            }
            if (map[cur.first + dy[i]][cur.second + dx[i]] == 0) {
                continue ;
            }
            q.push({cur.first + dy[i], cur.second + dx[i]});
            visited[cur.first + dy[i]][cur.second + dx[i]] = visited[cur.first][cur.second] + 1;
        }
    }
}

void solve() {
    input();
    solution();
    cout << visited[N - 1][M - 1];
}

int main() {
    solve();
}