#include <iostream>

using namespace std;

int main() {
	int A, B, C;

	cin >> A >> B >> C;
	if (A == B && B == C) {
		if (A + B + C == 180)
			cout << "Equilateral" << '\n';
		else
			cout << "Error" << '\n';
	} else if (A == B || B == C || A == C) {
		if (A + B + C == 180)
			cout << "Isosceles" << '\n';
		else
			cout << "Error" << '\n';
	} else {
		if (A + B + C == 180)
			cout << "Scalene" << '\n';
		else
			cout << "Error" << '\n';
	}
}
