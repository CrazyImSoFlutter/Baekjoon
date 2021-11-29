#include <iostream>
#include <algorithm>

using namespace std;

int a, m;
int c[50001];
int dp[4][50001];
int cumul[50001];

int main() {
	ios_base :: sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	cin >> a;
	for (int i = 1; i <= a; i++)
		cin >> c[i];
	cumul[1] = c[1];
	for (int i = 2; i <= a; i++)
		cumul[i] = cumul[i - 1] + c[i];
	cin >> m;

	for (int i = 1; i <= 3; i++) {
		for (int j = i * m; j <= a; j++)
			dp[i][j] = max(dp[i][j - 1], dp[i - 1][j - m] + (cumul[j] - cumul[j - m]));
	}
	cout << dp[3][a];
	return 0;
}
