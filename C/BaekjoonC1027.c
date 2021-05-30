#include <stdio.h>
#include <stdlib.h>

int getAnswer(int *building, int N) {
	double incline;
	double alpha;
	int answer = 0;
	int tower;
	int k;
	int errorFlag;

	for (int i = 0; i < N; i++) {
		tower = 0;
		for (int j = 0; j < N; j++) {
			if (j == i)
				continue ;
			incline = ((double)building[i] - (double)building[j]) / ((double)i - (double)j);
			alpha = (double)building[i] - (incline * (double)i);
			k = j;
			errorFlag = 0;
			if (k > i) {
				for (k -= 1; k > i; k--) {
					if (building[k] >= incline * k + alpha)
						errorFlag = 1;
				}
				if (errorFlag == 0) {
					tower++;
				}
			} else {
				for (k += 1; k < i; k++) {
					if (building[k] >= incline * k + alpha)
						errorFlag = 1;
				}
				if (errorFlag == 0) {
					tower++;
				}
			}
		}
		if (answer < tower)
			answer = tower;
	}
	return answer;
}

int main() {
	int N;
	int *building;
	scanf("%d", &N);

	building = malloc(sizeof(int) * N);
	for (int i = 0; i < N; i++) {
		scanf("%d", &building[i]);
	}
	printf("%d", getAnswer(building, N));
}
