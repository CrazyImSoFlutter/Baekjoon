#include <stdio.h>

int maze[101][101] = {0};
int DFSvisit[101] = {0};
int count = 0;

void DFS(int V, int N){
	count++;
	DFSvisit[V] = 1;
	for (int i = 0; i< N; i++){
		if (maze[V][i] == 1 && DFSvisit[i] == 0){
			DFS(i, N);
		}
	}
}

int main(){
	int N, M;
	char O[101];

	scanf("%d%d", &N. &M);
	for (int i = 0; i < N; i++){
		for (int j = 0; j < M; j++){
			scanf("%d", &O)
			maze[i][j] = O;
		}
	}
	DFS(1, N);
}
