#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
#define MAX 2001
#define INF 999999999
using namespace std;

int TC, N, M, T, S, G, H, distGH;
int distS[MAX];
int distG[MAX];
int distH[MAX];

vector<pair <int, int> > V[MAX];
vector<int> candidate;

void init() {
    for (int i = 0; i < MAX; i++) {
        V[i].clear();
        distS[i] = INF;
        distG[i] = INF;
        distH[i] = INF;
    }
    candidate.clear();
}

void dijkstra(int start, int A[MAX]) {
    priority_queue<pair<int, int> > pq;
    int cost, current, next, nCost;

    pq.push(make_pair(0, start));
    A[start] = 0;

    while (!pq.empty()) {
        cost = -pq.top().first;
        current = pq.top().second;

        pq.pop();
        for (int i = 0; i < V[current].size(); i++) {
            next = V[current][i].first;
            nCost = V[current][i].second;

            if (A[next] > cost + nCost) {
                A[next] = cost + nCost;
                pq.push(make_pair(-A[next], next));
            }
        }
    }
}

void solution() {
    int dest;

    cin >> N >> M >> T;
    cin >> S >> G >> H;
    for (int i = 0; i < M; i++) {
        int a, b, c;

        cin >> a >> b >> c;
        V[a].push_back(make_pair(b, c));
        V[b].push_back(make_pair(a, c));
    }
    for (int i = 0; i < T; i++) {
        int a;

        cin >> a;
        candidate.push_back(a);
    }

    dijkstra(S, distS);
    dijkstra(G, distG);
    distGH = distG[H];
    dijkstra(H, distH);
    sort(candidate.begin(), candidate.end());
    for (int i = 0; i < candidate.size(); i++) {
        dest = candidate[i];
        if (distS[dest] == distS[G] + distGH + distH[dest]) {
            cout << dest << " ";
        } else if (distS[dest] == distS[H] + distGH + distG[dest]) {
            cout << dest << " ";
        }
    }
    cout << '\n';
}

int main() {
    cin >> TC;

    for (int i = 0; i < TC; i++) {
        init();
        solution();
    }
}