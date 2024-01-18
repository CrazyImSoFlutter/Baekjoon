#include <iostream>
#include <algorithm>
#include <queue> 
#define MAX 101 
using namespace std; 

int n, m;
int graph[MAX][MAX];
int paths[MAX];
int bacons[MAX];
bool visited[MAX]; 

void bfs(int start){
	queue<int> q;
	q.push(start);
	visited[start] = true;

	while(!q.empty()){
		int i = q.front(); 
		q.pop();

		for(int j = 1; j <= n; j++){
			if(graph[i][j] == 1 && !visited[j]) {
				visited[j] = true;
				q.push(j);

				paths[j] = paths[i] + 1; 
			}
		}
	}
}

int getMinPerson(){
	int minBacon = bacons[1];
	int answer = 1;

	for(int i = 2; i <= n; i++){ 
		if(minBacon > bacons[i]){ 
			minBacon = bacons[i]; 
			answer = i; 
		}
	}

	return answer;
}

int main()
{
	ios_base::sync_with_stdio(0);
	cin.tie(0);

	cin >> n >> m;

	for(int i = 0; i < m; i++){
		int x, y;
		cin >> x >> y;
		graph[x][y] = graph[y][x] = 1; 
	}

	for(int i = 1; i <= n; i++){
		bfs(i);

		for(int j = 1; j <= n; j++){
			if(i == j) continue;
			bacons[i] += paths[j]; 
		}
		fill(visited, visited + MAX, 0);
		fill(paths, paths + MAX, 0);
	}
	cout << getMinPerson(); 

	return 0;
} 