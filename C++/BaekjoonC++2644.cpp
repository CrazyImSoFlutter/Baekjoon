#include<iostream>
#include<queue>
 
using namespace std;
 
int G[101][101];
int V[101];
int N, M, A, B;


void input() {
  ios::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

  cin >> N >> A >> B >> M;

  int x, y;
	while (M--) {
		cin >> x >> y;
		G[x][y] = 1;
		G[y][x] = 1;
	}
}


void BFS() {
	queue<int> Q;
	Q.push(A);
	V[A] = 1;
	while (!Q.empty()) {
		int node = Q.front();
		Q.pop();
		int tmp = V[node];

		for (int i = 1; i <= N; i++) {
			if (G[node][i] && !V[i]) {
				Q.push(i);
				V[i] = tmp + 1;
			}
		}
	}
}

void output() {
  if (V[B])
		cout << V[B] - 1;
	else
		cout << -1;
}
 
int main() {
  input();
	BFS();
  output();
}
 