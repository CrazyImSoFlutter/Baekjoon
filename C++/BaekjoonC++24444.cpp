#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>

using namespace std;

int N, M, R, cnt;
int V[100001];
vector<int> G[100001];

void input() {
  scanf("%d %d %d", &N, &M, &R);

  while(M--) {
    int A, B;

    scanf("%d %d", &A, &B);

    G[A].push_back(B);
    G[B].push_back(A);
  }

  for (int i = 1; i <= N; i++) {
    sort(G[i].begin(), G[i].end());
  }
}

void bfs() {
  queue<int> Q;

  Q.push(R);
  V[R] = ++cnt;

  while(!Q.empty()) {
    int node = Q.front();
    Q.pop();

    for (int i = 0; i < G[node].size(); i++) {
      int next = G[node][i];

      if (V[next] == 0) {
        Q.push(next);
        V[next] = ++cnt;
      }
    }
  }
}

void output() {
  for (int i = 1; i <= N; i++) {
    printf("%d ", V[i]);
  }
}

int main() {
  input();
  bfs();
  output();
}