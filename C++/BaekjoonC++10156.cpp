#include <iostream>

using namespace std;

int main() {
	int K, N, M;

	cin >> K >> N >> M;
	cout << (K * N - M > 0 ? K * N - M : 0);
}
