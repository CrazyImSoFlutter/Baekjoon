#include <iostream>

using namespace std;

void fill(int *a) {
	int cnt = 0;

	for (int i = 1; i <= 45; i++) {
		for (int j = 0; j < i; j++) {
			cnt++;
			if (cnt > 1000)
				return ;
			a[cnt] = i;
		}
	}

}

int main() {
	int a[1037];
	int A, B;
	int answer;

	fill(a);
	cin >> A >> B;
	answer = 0;
	for (int i = A; i <= B; i++)
		answer += a[i];
	cout << answer;
}
