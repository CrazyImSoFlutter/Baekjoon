#include <iostream>
#include <vector>
#include <utility>
#include <string>

using namespace std;

int R, C;
char map[50][50];
int visit_h[50][50];
int dy[] = {0, 0, -1, 1};
int dx[] = {-1, 1, 0, 0};
vector<pair<int, int> > Q_h;
vector<pair<int, int> > Q_w;
pair<int, int> goal;

void input() {
    cin >> R >> C;
    for (int i = 0; i < R; i++) {
        string tmp;

        cin >> tmp;
        for (int j = 0; j < C; j++) {
            map[i][j] = tmp[j];
            if (tmp[j] == 'S') {
                Q_h.push_back(make_pair(i, j));
                map[i][j] = '.';
                visit_h[i][j] = 1;
            } else if (tmp[j] == '*') {
                Q_w.push_back(make_pair(i, j));
            } else if (tmp[j] == 'D')
                goal = make_pair(i, j);
        }
    }
}

void bfs() {
    int w_index;
    int h_index;

    w_index = 0;
    h_index = 0;
    while (1) {
        int w_size = Q_w.size() - w_index;
        int h_size = Q_h.size() - h_index;

        if (h_size == 0)
            break;
        for (int i = 0; i < w_size; i++) {
            int y = Q_w[w_index].first;
            int x = Q_w[w_index].second;

            w_index++;
            for (int j = 0; j < 4; j++) {
                int yp = y + dy[j];
                int xp = x + dx[j];

                if (yp < 0 || yp >= R || xp < 0 || xp >= C)
                    continue ;
                if (map[yp][xp] == '.') {
                    map[yp][xp] = '*';
                    Q_w.push_back(make_pair(yp, xp));
                }
            }
        }
        for (int i = 0; i < h_size; i++) {
            int y = Q_h[h_index].first;
            int x = Q_h[h_index].second;

            h_index++;
            for (int j = 0; j < 4; j++) {
                int yp = y + dy[j];
                int xp = x + dx[j];

                if (yp < 0 || yp >= R || xp < 0 || xp >= C)
                    continue ;
                if ((map[yp][xp] == '.' || map[yp][xp] == 'D') && visit_h[yp][xp] == 0) {
                    visit_h[yp][xp] = visit_h[y][x] + 1;
                    Q_h.push_back(make_pair(yp, xp));
                }
            }
        }
    }
    if (visit_h[goal.first][goal.second] == 0) {
        cout << "KAKTUS\n";
    } else {
        cout << visit_h[goal.first][goal.second] - 1 << "\n";
    }
}

void solution() {
    input();
    bfs();
}

int main() {
    solution();
}
