#include<iostream>
using namespace std;

int factorial(int n)
{
	if (n == 1 || n == 0)
	{
		return 1;
	}
	return n * factorial(n - 1);
}

int main()
{
	int N = 0;
	cin >> N;
	cout << factorial(N);
}
