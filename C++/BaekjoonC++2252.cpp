#include <cstdio>
#include <vector>
#include <queue>

using namespace std;

int N, M;
vector<int> ary[32001];
int degree[32001];

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

void input() {
    get(N); get(M);

    for (int i = 0; i < M; i++) {
        int a, b;

        get(a); get(b);
        ary[a].push_back(b);
        degree[b]++;
    }
}

void topology() {
    queue<int> Q;
    int result[32001];

    for (int i = 1; i <= N; i++) {
        if (degree[i] == 0)
            Q.push(i);
    }

    for (int i = 1; i <= N; i++) {
        int x;

        if (Q.empty()) {
            break ;
        }
        x = Q.front();
        Q.pop();
        result[i] = x;
        for (int i = 0; i < ary[x].size(); i++) {
            int y = ary[x][i];
            
            if (--degree[ary[x][i]] == 0)
                Q.push(y);
        }
    }
    for (int i = 1; i <= N; i++) {
        printf("%d ", result[i]);
    }
}

void solve() {
    input();
    topology();
}

int main() {
    solve();
}
