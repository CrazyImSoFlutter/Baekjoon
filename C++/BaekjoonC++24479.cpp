#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int N, M, R, cnt;
vector<int> G[100001];
int V[100001];

void dfs(int node) {
  if (V[node] != 0) {
    return ;
  }
  
  V[node] = ++cnt;

  for (int i = 0; i < G[node].size(); i++) {
    dfs(G[node][i]);
  }
}

int main() {
    scanf("%d %d %d", &N, &M, &R);

  while (M--) {
    int A, B;

    scanf("%d %d", &A, &B);

    G[A].push_back(B);
    G[B].push_back(A);
  }

  for (int i = 1; i <= N; i++) {
    sort(G[i].begin(), G[i].end());
  }

  dfs(R);

  for (int i = 1; i <= N; i++) {
    
    printf("%d\n", V[i]);
  }
}