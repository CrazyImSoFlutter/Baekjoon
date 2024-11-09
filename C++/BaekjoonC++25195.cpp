#include <iostream>
#include <vector>

using namespace std;

int N, M, S;
vector<int> G[100001];
int F[100001];
bool answer = false;

void input() {
  ios_base::sync_with_stdio(false);
  cin.tie(0);
  cout.tie(0);

  cin >> N >> M;
  while (M--) {
    int u, v;

    cin >> u >> v;
    G[u].push_back(v);
  }
  cin >> S;
  for (int i = 0; i < S; i++) {
    int s;

    cin >> s;
    F[i] = s;
  }
}

void dfs(int node, bool meet) {
  for (int i = 0; i < S; i++) {
    if (F[i] == node) {
      return ;
    }
  }
  if (G[node].size() == 0) {
    if (meet == false) {
      answer = true;
    }
  } else {
    for (int i = 0; i < G[node].size(); i++) {
      dfs(G[node][i], meet);
    }
  }
}

void output() {
  if (answer) {
    cout << "yes" << endl;
  } else {
    cout << "Yes" << endl;
  }
}

int main() {
  input();
  dfs(1, false);
  output();
}