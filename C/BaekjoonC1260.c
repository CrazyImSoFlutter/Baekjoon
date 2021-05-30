#include <stdio.h>

int Graph[1001][1001] = {0};
int DFSvisit[1001] = {0};
int BFSvisit[1001] = {0};
int DFSqueue[1001];
int BFSqueue[1001];
int DFStop = 0;

void DFS(int V, int N){
	DFSvisit[V] = 1;
	printf("%d ", V);
	for(int i = 1; i <= N; i++){
		if (Graph[V][i] == 1 && DFSvisit[i] == 0)
			DFS(i, N);
	}
}

void BFS(int V, int N){
	int front = 0;
	int rear = 0;
	int pop;
	
	printf("%d ", V);
	BFSqueue[0] = V;
	rear++;
	BFSvisit[V] = 1;

	while(front < rear){
		pop = BFSqueue[front];
		front++;
		for (int i = 1; i <= N; i++){
			if (Graph[pop][i] == 1 && BFSvisit[i] == 0){
				printf("%d ", i);
				BFSqueue[rear] = i;
				rear++;
				BFSvisit[i] = 1;
			}
		}
	}
}

int main (){
	int N;
	int M;
	int V;

	int j, k;

	scanf("%d%d%d", &N, &M, &V);
	for (int i = 0; i < M; i++){
		scanf("%d %d", &j ,&k);
		Graph[j][k] = 1;
		Graph[k][j] = 1;
	}
	DFS(V, N);
	printf("\n");
	BFS(V, N);
}
