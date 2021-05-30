#include <stdio.h>

int Graph[1001][1001] = {0};
int BFSvisit[1001] = {0};
int BFSqueue[1001];
int DFStop = 0;

int BFS(int V, int N){
	int front = 0;
	int rear = 0;
	int pop;
	int count = 0;
	
	BFSqueue[0] = V;
	rear++;
	BFSvisit[V] = 1;

	while(front < rear){
		pop = BFSqueue[front];
		front++;
		for (int i = 1; i <= N; i++){
			if (Graph[pop][i] == 1 && BFSvisit[i] == 0){
				count++;
				BFSqueue[rear] = i;
				rear++;
				BFSvisit[i] = 1;
			}
		}
	}
	return count;
}

int main (){
	int N;
	int M;

	int j, k;

	scanf("%d%d", &N, &M);
	for (int i = 0; i < M; i++){
		scanf("%d %d", &j ,&k);
		Graph[j][k] = 1;
		Graph[k][j] = 1;
	}
	printf("%d", BFS(1, N));
}

