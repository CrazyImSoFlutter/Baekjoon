#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

int N, M;
vector<int> T[400001];

void add_tree(int node, int start, int end, int index, int data) {
	int mid;

	if (index < start || index > end)
		return ;
	T[node].push_back(data);
	if (start != end) {
		mid = (start + end) / 2;
		add_tree(node * 2, start, mid, index, data);
		add_tree(node * 2 + 1, mid + 1, end, index, data);
	}
}

int query(int node, int start, int end, int qstart, int qend, int data) {
	int q1, q2, mid;

	if (start > qend || end < qstart)
		return 0;
	if (qstart <= start && end <= qend)
		return lower_bound(T[node].begin(), T[node].end(), data) - T[node].begin();
	mid = (start + end) / 2;
	q1 = query(node * 2, start, mid, qstart, qend, data);
	q2 = query(node * 2 + 1, mid + 1, end, qstart, qend, data);
	return q1 + q2;
}

void input() {
	int tmp;

	ios::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> N >> M;
	for (int i = 1; i <= N; i++) {
		cin >> tmp;
		add_tree(1, 1, N, i, tmp);
	}
	for (int i = 1; i <= 400000; i++)
		sort(T[i].begin(), T[i].end());
}

void solution() {
	int i, j, k, l, r, mid, ans;

	while (M--) {
		cin >> i >> j >> k;
		l = -1e9, r = 1e9;
		while (l <= r) {
			mid = (l + r) / 2;
			if (query(1, 1, N, i, j, mid) < k) {
				ans = mid;
				l = mid + 1;
			}
			else
				r = mid - 1;
		}
		printf("%d\n", ans);
	}
}

void solve() {
	input();
	solution();
}

int main() {
	solve();
}
