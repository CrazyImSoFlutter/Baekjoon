#include <iostream>
#include <string.h>
#include <queue>
#include <utility>

using namespace std;

int map[1001][1001];
int dist[1001][1001];
int n, m;
int startY, startX;
int dx[4] = {-1, 0, 1, 0};
int dy[4] = {0, 1, 0, -1};

int main() {
    memset(dist, -1, sizeof(dist));

    cin >> n >> m;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            cin >> map[i][j];
            if (map[i][j] == 2) {
                startY = i;
                startX = j;
                dist[i][j] = 0;
            }
        }
    }

    queue<pair<int, int> > bfsQueue;

    bfsQueue.push(make_pair(startY, startX));
    while (!bfsQueue.empty()) {
        pair<int, int> current = bfsQueue.front();
        bfsQueue.pop();

        for (int i = 0; i < 4; i++) {
            if (current.first + dy[i] < 0
                || current.first + dy[i] >= n
                || current.second + dx[i] < 0
                || current.second + dx[i] >= m)
                continue;

            if (map[current.first + dy[i]][current.second + dx[i]] == 1
            && dist[current.first + dy[i]][current.second + dx[i]] == -1) {
                dist[current.first + dy[i]][current.second + dx[i]] = dist[current.first][current.second] + 1;
                bfsQueue.push(make_pair(current.first + dy[i], current.second + dx[i]));
            }
        }
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (map[i][j] == 2 || map[i][j] == 1) {
                cout << dist[i][j] << " ";
            } else {
                cout << "0 ";
            }
        }
        cout << "\n";
    }
}