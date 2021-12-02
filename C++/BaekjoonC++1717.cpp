#include<stdio.h>

using namespace std;

int n, m;
int parent[1000001];

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

int main() {
    get(n); get(m);
    
    for (int i = 0; i <= n; i++)
        parent[i] = i;

    for (int i = 0; i < m; i++) {
        int command, a, b;

        get(command); get(a); get(b);
        if (command == 0)
            make_union(a, b);
        else {
            if (find_parent(a) == find_parent(b))
                printf("YES\n");
            else
                printf("NO\n");
        }
    }
}
