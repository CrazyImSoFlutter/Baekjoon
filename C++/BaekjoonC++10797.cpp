#include <iostream>

using namespace std;

int main() {
	int A, B, C;

	cin >> A;
	C = 0;
	for (int i = 0; i < 5; i++) {
		cin >> B;
		if (A == B)
			C++;
	}
	cout << C;
}
