#include <stdio.h>

int Graph[1001][1001] = {0};
int DFSvisit[1001] = {0};
int BFSvisit[1001] = {0};
int DFSqueue[1001];
int BFSqueue[1001];
int DFStop = 0;
int BFStop = 0;

void DFS(int V, int N){
	int i;

	DFSvisit[V] = 1;
	queue[top] = V;
	top++;
	for(int i = 1; i <= N; i++){
		if (Graph[v][i] == 1 && DFSvisit[i] == 0)
			DFS(i, N);
	}
}

void BFS(){
	int 
}

int main (){
	int N;
	int M;
	int V;
	
	scanf("%d%d%d", &N, &M, &V);

}
