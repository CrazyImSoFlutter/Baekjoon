#include <iostream>
#include <string.h>

using namespace std;

int main() {
	string B1, B2;
	long long A1, A2, tmp, idx;
	char A[32];

	cin >> B1 >> B2;
	A1 = 0;
	A2 = 0;
	tmp = 1;
	for (int i = B1.length() - 1; i >= 0; i--) {
		if (B1[i] == '1')
			A1 += tmp;
		tmp *= 2;
	}
	tmp = 1;
	for (int i = B2.length() - 1; i >= 0; i--) {
		if (B2[i] == '1')
			A2 += tmp;
		tmp *= 2;
	}
	tmp = A1 + A2;
	cout << tmp;
	idx = 0;
	while (tmp != 0) {
		if (tmp % 2 == 1)
			A[idx] = '1';
		else
			A[idx] = '0';
		tmp /= 2;
		idx++;
	}
	cout << idx;
	for (int i = idx - 1; i >= 0; i--) {
		cout << A[idx];
	}
}
