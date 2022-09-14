#include <iostream>
#include <string>

using namespace std;

int T;

void input() {
	cin >> T;
}

void solution(string S) {
	int left = 0;
	int right = S.length() - 1;
	int flag = 1;
	int answer = 0;

	while (left <= right) {
		answer++;
		if (S[left] != S[right]) {
			flag = 0;
			break;
		}
		left++;
		right--;
	}
	if (flag == 1 && S.length() % 2 == 0) {
		answer++;
	}
	cout << flag << " " << answer << "\n";
}


void solve() {
	string S;

	input();
	for (int i = 0; i < T; i++) {
		cin >> S;
		solution(S);
	}
}

int main() {
	solve();
}
