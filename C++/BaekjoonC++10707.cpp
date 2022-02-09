#include <iostream>

using namespace std;

int main() {
	int A, B, C, D, P;
	int X, Y;

	cin >> A >> B >> C >> D >> P;
	X = P * A;
	Y = B;
	if (P > C)
		Y += (P - C) * D;
	cout << (X > Y ? Y : X);
}
