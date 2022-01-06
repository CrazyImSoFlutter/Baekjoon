#include <cstdio>
#include <utility>
#include <algorithm>
#include <vector>

using namespace std;

int N, A;
vector <pair <int, int> > V;

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

bool compare(pair <int, int> a, pair <int, int> b) {
    if (a.first == b.first)
        return a.second < b.second;
    else
        return a.first < b.first;
}

void input() {
    get(N);
    for (int i = 0; i < N; i++) {
        int tmp;

        get(tmp);
        V.push_back({tmp, i});
    }
}

void solution() {
    sort(V.begin(), V.end(), compare);
    for (int i = 0; i < N; i++) {
        A = max(V[i].second - i, A);
    }
    printf("%d\n", A + 1);
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
