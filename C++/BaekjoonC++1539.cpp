#include <cstdio>
#include <algorithm>
#include <set>
#define MAX(x, y) (x > y ? x : y)

using namespace std;

int N;
long long A;
int height[250000];
int element[250000];
set<int> list;

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
    get(N);
    for (int i = 0; i < N; i++)
        get(element[i]);
}

int solution(int target) {
    long long left, right;
    set<int>::iterator index, tmp;

    index = list.lower_bound(target);
    if (index != list.begin()) {
        tmp = index;
        left = height[*(--tmp)];
    } else {
        left = 0;
    }

    if (index != list.end())
        right = height[*index];
    else
        right = 0;

    height[target] = MAX(left, right) + 1;
    list.insert(target);
    return height[target];
}

void solve() {
    input();
    for (int i = 0; i < N; i++)
        A += solution(element[i]);
    printf("%lld\n", A);
}

int main() {
    solve();
}

