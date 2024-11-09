#include <iostream>
#include <vector>
#include <queue>

using namespace std;

int N, M, K, X;
vector<int> G[300001];
int V[300001];

void input() {
  ios_base::sync_with_stdio(NULL);
  cin.tie(NULL);
  cout.tie(NULL);

  cin >> N >> M >> K >> X;

  while (M--) {
    int A, B;

    cin >> A >> B;

    G[A].push_back(B);
  }
}

void BFS() {
  queue<int> Q;

  Q.push(X);
  V[X] = 1;

  while(!Q.empty()) {
    int cur = Q.front();
    Q.pop();

    for (int i = 0; i < G[cur].size(); i++) {
      if (V[G[cur][i]] == 0) {
        V[G[cur][i]] = V[cur] + 1;
        Q.push(G[cur][i]);
      }
    }
  }
}

void output() {
  bool isNone = true;

  for (int i = 1; i <= N; i++) {
    if (V[i] == K + 1) {
      cout << i << endl;
      isNone = false;
    }
  }
  if (isNone) {
    cout << -1 << endl;
  }
}

int main() {
  input();
  BFS();
  output();
}