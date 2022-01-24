#include <iostream>
#define MAX(x, y) (x > y ? x : y)

using namespace std;

int N;
int guilty[16];
int R[16][16];
bool death[16];
int P;
int answer;

void input() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	cin >> N;
	for (int i = 0; i < N; i++)
		cin >> guilty[i];

	for (int i = 0; i < N; i++)
		for (int j = 0; j < N; j++)
			cin >> R[i][j];
	cin >> P;
}

void solution(int night, int number) {
	int tmp;
	int target;

	if (death[P] == true || number == 1) {
		answer = MAX(answer, night);
		return ;
	}
	if (number % 2 == 0) {
		for (int i = 0; i < N; i++) {
			if (i == P || death[i] == true)
				continue ;
			death[i] = true;
			for (int j = 0; j < N; j++)
				guilty[j] += R[i][j];
			solution(night + 1, number - 1);
			for (int j = 0; j < N; j++)
				guilty[j] -= R[i][j];
			death[i] = false;
		}
	} else {
		tmp = 0;
		for (int i = 0; i < N; i++) {
			if (guilty[i] > tmp && death[i] == false) {
				tmp = guilty[i];
				target = i;
			}
		}
		if (target == P) {
			answer = MAX(answer, night);
			return ;
		}
		death[target] = true;
		solution(night, number - 1);
		death[target] = false;
	}
}

void solve() {
	input();
	solution(0, N);
	cout << answer << '\n';
}

int main() {
	solve();
}
