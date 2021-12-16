#include<iostream>
#include<math.h>
using namespace std;

int S[21][21];
bool visit[22];
int N;
int ans; 

void input() {
    cin >> N;
	for (int i = 1; i <= N; i++) {
		for (int j = 1; j <= N; j++) {
			cin >> S[i][j];
		}
	}
    ans = 1000000000;
}

void dfs(int x, int pos) {
    if (x == N / 2) {
	    int start, link;
		start = 0;
		link = 0;

		for (int i = 1; i <= N; i++) {
			for (int j = 1; j <= N; j++) {
				if (visit[i] == true && visit[j] == true) 
                    start += S[i][j];
				if (visit[i] == false && visit[j] == false) 
                    link += S[i][j];
			}
		}

		int temp = abs(start - link);
		if (ans > temp) 
            ans = temp;
		return;
	}

	for (int i = pos; i < N; i++) {
		visit[i] = true;
		dfs(x + 1, i + 1);
		visit[i] = false;
	}
}

void solve() {
    input();
    dfs(0, 1);
    cout << ans;
}

int main() {
    solve();
}
