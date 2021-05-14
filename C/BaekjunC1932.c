#include <stdio.h>

int max(int i, int j){
	return (i > j) ? i : j;
}

int main (){
	int triangle[501][501];
	int dp[501][501];
	int N;
	int answer;

	answer = 0;
	scanf("%d", &N);
	for (int i = 0; i < N; i++){
		for (int j = 0; j <= i; j++){
			scanf("%d", &triangle[i][j]);
		}
	}
	dp[0][0] = triangle[0][0];
	for (int i = 1; i < N; i++){
		for (int j = 0; j <= i; j++){
			if(j == 0)
				dp[i][j] = dp[i - 1][j] + triangle[i][j];
			else if (i == j)
				dp[i][j] = dp[i - 1][j - 1] + triangle[i][j];
			else
				dp[i][j] = max(dp[i - 1][j - 1], dp[i - 1][j]) + triangle[i][j];
			if (i == N - 1)
				answer = max(answer, dp[i][j]);
		}
	}
	printf("%d", answer);
}
