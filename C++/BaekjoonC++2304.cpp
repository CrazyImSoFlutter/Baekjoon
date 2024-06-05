#include <iostream>
#include <algorithm>

using namespace std;

int N;
int maxIndex, maxHeight;
int pillar[1001];
int answer = 0;

int main(void) {
    int leftHeight = 0;
    int rightHeight = 0;

	
	cin >> N;
	for (int i = 0; i < N; i++) {
        int L, H;

		cin >> L >> H;
		pillar[L] = H;
		if (maxHeight < H) {
			maxIndex = L;
			maxHeight = H;
		}
	}

	for (int i = 1; i < maxIndex; i++) {
		leftHeight = max(leftHeight, pillar[i]);
		answer += leftHeight;
	}
	
	for (int i = 1000; i > maxIndex; i--) {
		rightHeight = max(rightHeight, pillar[i]);
		answer += rightHeight;
	}

	cout << answer + maxHeight;

}