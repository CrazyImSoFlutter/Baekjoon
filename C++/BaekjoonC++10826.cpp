#include <iostream>
#include <cstring>
#include <string>
#include <algorithm>
#include <vector>
using namespace std;

string sum(string x, string y)
{
	int num;
	int carry = 0;
	string result;

	reverse(x.begin(), x.end());
	reverse(y.begin(), y.end());

	while (x.length() < y.length()) {
		x += '0';
	}
	while (x.length() > y.length()) {
		y += '0';
	}

	for (int i = 0; i < x.length(); ++i) {
		num = (x[i] - '0' + y[i] - '0' + carry) % 10;
		result += to_string(num);
		carry = (x[i] - '0' + y[i] - '0' + carry) / 10;
	}

	if (carry) {
		result += to_string(carry);
	}

	reverse(result.begin(), result.end());

	return result;
}

int N;
string DP[10001];

int main()
{
	cin >> N;
	
	DP[0] = '0';
	DP[1] = '1';

	for (int i = 2; i <= N; ++i) {
		DP[i] = sum(DP[i - 1], DP[i - 2]);
	}

	cout << DP[N] << endl;
	return 0;
}