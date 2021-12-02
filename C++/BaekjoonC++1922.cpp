#include <stdio.h>
#include <vector>
#include <tuple>
#include <algorithm>

using namespace std;

int N, M, answer;
vector<tuple<int, int, int> > graph;
int parent[1001];

inline void get(int& x) {
	int c = getchar_unlocked();

	x = 0;
	int neg = 0;
	for (; ((c < 48 || c > 57) && c != '-'); c = getchar_unlocked());
	if (c == '-') {
		neg = 1;
		c = getchar_unlocked();
	}
	for (; c > 47 && c < 58; c = getchar_unlocked()) {
		x = (x << 1) + (x << 3) + c - 48;
	}
	if (neg)
		x = -x;
}

bool compare(tuple<int, int, int> a, tuple<int, int, int> b) {
    return get<2>(a) < get<2>(b);
}

int find_parent(int a) {
    if (a == parent[a])
        return a;
    else
        return parent[a] = find_parent(parent[a]);
}

void make_union(int a, int b) {
    int pa = find_parent(a);
    int pb = find_parent(b);

    if (pa > pb)
        parent[pa] = pb;
    else if (pa < pb)
        parent[pb] = pa;
}

bool check_parent(int a, int b) {
    int x = find_parent(a);
    int y = find_parent(b);

    if (x == y)
        return true;
    else
        return false;
}

int main() {
    get(N); get(M);
    for(int i = 0; i < M; i++) {
        int F, T, C;
        
        get(F); get(T); get(C);
        graph.push_back(make_tuple(F, T, C));
    }
    for (int i = 0; i < N; i++) {
        parent[i] = i; 
    }
    sort(graph.begin(), graph.end(), compare);
    
    for (int i = 0; i < M; i++) {
        if (!check_parent(get<0>(graph[i]), get<1>(graph[i]))) {
            make_union(get<0>(graph[i]), get<1>(graph[i]));
            answer += get<2>(graph[i]);
        }
    }
    printf("%d", answer);
}
