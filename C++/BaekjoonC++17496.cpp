#include <iostream>

int main() {
	int N, T, C, P;

	std::cin >> N >> T >> C >> P;
	
	std::cout << (N - 1) / T * C * P;
}
