#include<iostream>
#include<algorithm>
using namespace std;

int main()
{
	int N;
	cin >> N;
	double* n = new double[1000];

	for (int i = 0; i < N; i++)
	{
		cin >> n[i];
	}

	sort(n, n + N);

	double sum = 0;
	for (int i = 0; i < N; i++)
	{
		n[i] = (n[i] / n[N - 1]) * 100;
		sum += n[i];
	}

	sum = sum / (N);
	cout << sum;
}
