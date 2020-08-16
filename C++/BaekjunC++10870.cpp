#include<iostream>
using namespace std;

int fibo(int n)
{
	if (n == 1)
	{
		return 1;
	}
	else if (n == 0)
	{
		return 0;
	}
	else if (n == 2)
	{
		return 1;
	}
	return fibo(n - 1) + fibo(n - 2);
}

int main()
{
	int N = 0;
	cin >> N;
	cout << fibo(N);
}
