#include<iostream>
#include<algorithm>
using namespace std;

int main()
{
	int N = 0;
	cin >> N;

	int* a = new int[1000000];

	a[N] = { 0, };
	for (int i = 0; i < N; i++)
	{
		cin >> a[i];
	}
	int min = 0;
	int max = 0;

	sort(a, a + N);
	min = a[0];
	max = a[N - 1];

	cout << min << " " << max;
}
