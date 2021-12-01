#include<stdio.h>
#include<queue>
#include<vector>

using namespace std;

/*fast Input*/
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

int N, M;
vector<int> graph[1001];
int visit[1001];
int answer;

/*solution 1 basic BFS*/
void BFS(int start) {
	queue<int> q;

	q.push(start);
	while (q.size()) {
		int cur = q.front();
		q.pop();
		vector<int>::iterator ptr;
		vector<int> &c = graph[cur];

		for (ptr = c.begin(); ptr != c.end(); ++ptr) {
			if (!visit[*ptr]) {
				q.push(*ptr);
				visit[*ptr] = 1;
			}
		}
	}
	answer++;
}

/*solution 2 c++11 extension for-loop*/
void visited(int n) {
	visit[n] = true;
	for (int c : graph[n]) {
		if (!visit[c]) visited(c);
	}
}

int main() {
	get(N); get(M);
	for (int i = 0; i < M; i++) {
		int a, b;

		get(a); get(b);
		graph[a].push_back(b);
		graph[b].push_back(a);
	}

	/* solution 1
	for (int i = 1; i <= N; i++) {
		if (!visit[i] && graph[i].size())
			BFS(i);
		else if (!visit[i] && !graph[i].size())
			answer++;
	}*/

	/* solution 2*/
	for (int i = 1; i <= N; i++) {
		if (!visit[i]) {
			answer++;
			visited(i);
		}
	}
	printf("%d", answer);
}
