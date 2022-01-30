#include <iostream>
#include <vector>
#include <string.h>
#define max(x, y) (x > y ? x : y)
typedef long long ll;
#define vec vector<vector<ll> >

using namespace std;

int N;
ll answer;
vec B(20, vector<ll>(20));

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> N;
	for (int i = 0; i < N; i++)
		for (int j = 0; j < N; j++)
			cin >> B[i][j];
}

ll get_max(vec board) {
	ll ret;

	ret = 0;
	for (int i = 0; i < N; i++)
		for (int j = 0; j < N; j++)
			ret = max(ret, board[i][j]);
	return ret;
}

vec right(vec board) {
	bool check[20][20];

	for (int i = 0; i < 20; i++)
		memset(check[i], false, sizeof(bool) * 20);
	for (int i = 0; i < N; i++) {
		for (int j = N - 2; j >= 0; j--) {
			if (board[i][j] == 0)
				continue ;
			for (int k = j + 1; k < N; k++) {
				if (board[i][k] == board[i][k - 1] && !check[i][k]) {
					board[i][k] *= 2;
					board[i][k - 1] = 0;
					check[i][k] = true;
					break ;
				} else if (board[i][k] == 0) {
					board[i][k] = board[i][k - 1];
					board[i][k - 1] = 0;
				} else
					break ;
			}
		}
	}
	return board;
}

vec left(vec board) {
	bool check[20][20];

	for (int i = 0; i < 20; i++)
		memset(check[i], false, sizeof(bool) * 20);
	for (int i = 0; i < N; i++) {
		for (int j = 1; j < N; j++) {
			if (board[i][j] == 0)
				continue ;
			for (int k = j - 1; k >= 0; k--) {
				if (board[i][k] == board[i][k + 1] && !check[i][k]) {
					board[i][k] *= 2;
					board[i][k + 1] = 0;
					check[i][k] = true;
					break ;
				} else if (board[i][k] == 0) {
					board[i][k] = board[i][k + 1];
					board[i][k + 1] = 0;
				} else
					break ;
			}
		}
	}
	return board;
}

vec down(vec board) {
	bool check[20][20];

	for (int i = 0; i < 20; i++)
		memset(check[i], false, sizeof(bool) * 20);
	for (int i = 0; i < N; i++) {
		for (int j = N - 2; j >= 0; j--) {
			if (board[j][i] == 0)
					continue ;
			for (int k = j + 1; k < N; k++) {
				if (board[k][i] == board[k - 1][i] && !check[k][i]) {
					board[k][i] *= 2;
					board[k - 1][i] = 0;
					check[k][i] = true;
					break ;
				} else if (board[k][i] == 0) {
					board[k][i] = board[k - 1][i];
					board[k - 1][i] = 0;
				} else
					break ;
			}
		}
	}
	return board;
}

vec up(vec board) {
	bool check[20][20];

	for (int i = 0; i < 20; i++)
		memset(check[i], false, sizeof(bool) * 20);
	for (int i = 0; i < N; i++) {
		for (int j = 1; j < N; j++) {
			if (board[j][i] == 0)
				continue ;
			for (int k = j - 1; k >= 0; k--) {
				if (board[k][i] == board[k + 1][i] && !check[k][i]) {
					board[k][i] *= 2;
					board[k + 1][i] = 0;
					check[k][i] = true;
					break ;
				} else if (board[k][i] == 0) {
					board[k][i] = board[k + 1][i];
					board[k + 1][i] = 0;
				} else
					break ;
			}
		}
	}
	return board;
}


void solution(int depth, vec board) {
	answer = max(answer, get_max(board));
	if (depth == 5)
		return ;
	solution(depth + 1, right(board));
	solution(depth + 1, left(board));
	solution(depth + 1, up(board));
	solution(depth + 1, down(board));
}

void solve() {
	input();
	solution(0, B);
	cout << answer << '\n';
}

int main() {
	solve();
}


