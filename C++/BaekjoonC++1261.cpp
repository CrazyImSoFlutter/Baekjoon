#include <iostream>
#include <queue>
#include <utility>
#include <string>

using namespace std;

int N, M;
int maze[100][100];
int dist[100][100];
int dy[] = {1, -1, 0, 0};
int dx[] = {0, 0, 1, -1};

void bfs(int ys, int xs) {
    queue<pair<int, int> > bfsq;

    bfsq.push(make_pair(ys, xs));
    dist[ys][xs] = 0;
    while (bfsq.empty() == false) {
        int y = bfsq.front().first;
        int x = bfsq.front().second;

        bfsq.pop();
        for (int i = 0; i < 4; i++) {
            int yp = y + dy[i];
            int xp = x + dx[i];

            if (yp < 0 || yp >= N || xp < 0 || xp >= M)
                continue;
            if (maze[yp][xp] == 1) {
                if (dist[yp][xp] > dist[y][x] + 1) {
                    dist[yp][xp] = dist[y][x] + 1;
                    bfsq.push(make_pair(yp, xp));
                }             
            } else if (maze[yp][xp] == 0) {
                if (dist[yp][xp] > dist[y][x]) {
                    dist[yp][xp] = dist[y][x];
                    bfsq.push(make_pair(yp, xp));
                }
            }
        }
    }
}

void input() {
    cin >> M >> N;
    for (int i = 0; i < N; i++) {
        string input;

        cin >> input;
        for (int j = 0; j < input.length(); j++) {
            maze[i][j] = input[j] - '0';
            dist[i][j] = 2100000000;
        }
    }
}

void solution() {
    input();
    bfs(0, 0);
    cout << dist[N - 1][M - 1] << endl;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    solution();
}
