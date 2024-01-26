#include <iostream>

using namespace std;

int N;
long long x[100001];
long long sum[100001];
long long answer;

int main() {
	cin.tie(NULL);
    cout.tie(NULL);
    ios::sync_with_stdio(false);

    cin >> N;
	for (int i = 1; i <= N; i++) {
		cin >> x[i];
		sum[i] = sum[i - 1] + x[i];
	}

	for (int i = 1; i < N; i++) {
		answer += (sum[N] - sum[i]) * x[i];
	}
	
    cout << answer << "\n";

	return 0;
}