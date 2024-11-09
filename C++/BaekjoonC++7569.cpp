#include <iostream>
#include <vector>
#include <queue>
#include <tuple>

using namespace std;

int dx[6] = {-1, 1, 0, 0, 0, 0};
int dy[6] = {0, 0, -1, 1, 0, 0};
int dz[6] = {0, 0, 0, 0, -1, 1};
vector<vector<vector<int>>> B(101, vector<vector<int>>(101, vector<int>(101)));
vector<vector<vector<bool>>> V(101, vector<vector<bool>>(101, vector<bool>(101, false)));
int M, N, H;
int answer = -1;
queue<tuple<int, int, int>> BFSq;

void input() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);
  cout.tie(NULL);

  cin >> M >> N >> H;

  for (int i = 0; i < H; ++i) {
    for (int j = 0; j < N; ++j) {
      for (int k = 0; k < M; ++k) {
        cin >> B[j][k][i];
        if (B[j][k][i] == 1) {
          V[j][k][i] = true;
          BFSq.push(make_tuple(j, k, i));
        } else if (B[j][k][i] == -1) {
          V[j][k][i] = true;
        }
      }
    }
  }
}

void BFS() {
  while (!BFSq.empty()) {
    int size = BFSq.size();
    ++answer;
    for (int i = 0; i < size; ++i) {
      auto [curN, curM, curH] = BFSq.front();
      BFSq.pop();

      for (int j = 0; j < 6; ++j) {
          int qN = curN + dy[j];
          int qM = curM + dx[j];
          int qH = curH + dz[j];

          if (qN < 0 || qN >= N || qM < 0 || qM >= M || qH < 0 || qH >= H) {
            continue;
          }

          if (!V[qN][qM][qH] && B[qN][qM][qH] == 0) {
            V[qN][qM][qH] = true;
            BFSq.push(make_tuple(qN, qM, qH));
          }
      }
    }
  }
}

void output() {
  for (int i = 0; i < N; ++i) {
    for (int j = 0; j < M; ++j) {
      for (int k = 0; k < H; ++k) {
        if (!V[i][j][k]) {
          cout << -1 << endl;
          return ;
        }
      }
    }
  }

  cout << answer << endl;
}

int main() {    
  input();
  BFS();
  output();
}