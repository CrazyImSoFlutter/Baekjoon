#include <cstdio>
#include <climits>
#define MIN(x, y) (x > y ? y : x)

using namespace std;

int V, E, A;
int dist[401][401];

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
    get(V); get(E);

    A = INT_MAX;
    for (int i = 1; i <= V; i++) {
        for (int j = 1; j <= V; j++) {
            dist[i][j] = INT_MAX;
        }
    }
    for (int i = 0; i < E; i++) {
        int a, b, c;

        get(a); get(b); get(c);
        dist[a][b] = c;
    }
}

void solution() {
    for (int k = 1; k <= V; k++) {
        for (int i = 1; i <= V; i++) {
            for (int j = 1; j <= V; j++) {
                if (dist[i][k] != INT_MAX && dist[k][j] != INT_MAX)
                    dist[i][j] = MIN(dist[i][j], dist[i][k] + dist[k][j]);
            }
        }
    }

    for (int i = 1; i <= V; i++) {
        A = MIN(A, dist[i][i]);
    }
    if (A == INT_MAX)
        printf("-1\n");
    else
        printf("%d\n", A);
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
