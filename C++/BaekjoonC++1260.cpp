#include <iostream>
#include <vector>
#include <queue>

using namespace std;

int N, M, V;
bool graph[1001][1001];
bool dfsVisit[1001];
bool bfsVisit[1001];

void dfs(int start) {
    dfsVisit[start] = true;
    cout << start << " ";
    for (int i = 1; i <= N; i++) {
        if (graph[start][i] && dfsVisit[i] == false) {
            dfs(i);
        }
    }
}

void bfs(int start) {
    int front = 0;
    queue<int> bfsQueue;

    bfsQueue.push(start);
    bfsVisit[start] = true;
    cout << start << " ";

    while(!bfsQueue.empty()) {
        front = bfsQueue.front();
        bfsQueue.pop();

        for (int i = 1; i <= N; i++) {
            if (graph[front][i] && bfsVisit[i] == false) {
                cout << i << " ";
                bfsQueue.push(i);
                bfsVisit[i] = true;
            }
        }
    }
}

int main() {
    cin >> N >> M >> V;

    for (int i = 0; i < M; i++) {
        int v1, v2;

        cin >> v1 >> v2;
        graph[v1][v2] = true;
        graph[v2][v1] = true;
    }

    dfs(V);
    cout << "\n";
    bfs(V);
}