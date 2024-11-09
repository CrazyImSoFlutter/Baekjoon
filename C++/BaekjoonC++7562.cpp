#include <iostream>
#include <queue>
#include <algorithm>
#include <tuple>
#include <string.h>

using namespace std;

int dx[] = {-2, -1, 1, 2, 2, 1, -1, -2};
int dy[] = {1, 2, 2, 1, -1, -2, -2, -1};

int T, l, sx, sy, ex, ey, answer;
int V[301][301];

void input() {
  cin >> l;
  cin >> sy >> sx;
  cin >> ey >> ex;
  answer = 0;
  for (int i = 0; i < 301; i++) {
    for (int j = 0; j < 301; j++) {
      V[i][j] = 0;
    }
  }
}

void BFS() {
  queue<tuple<int, int, int>> Q;

  Q.push({sy, sx, 0});

  V[sy][sx] = 1; 
  while (!Q.empty()) {
    tuple<int, int, int> cur = Q.front();
    Q.pop();

    
    if (get<0>(cur) == ey && get<1>(cur) == ex) {
      answer = get<2>(cur);
      break;
    }
    for(int i = 0; i < 8; i++) {
      int y = get<0>(cur) + dy[i];
      int x = get<1>(cur) + dx[i];

      if (y < 0 || y >= l || x < 0 || x >= l) {
        continue;
      }
      if (V[y][x] == 0) {
        Q.push({y, x, get<2>(cur) + 1});
        V[y][x] = 1;
      }
    }
  }
}

void output() {
  cout << answer << endl;
}

int main() {
  cin >> T;

  while (T--) {
    input();
    BFS();
    output();
  }
}