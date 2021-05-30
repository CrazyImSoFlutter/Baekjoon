#include<iostream>
#include<string>
using namespace std;

int main()
{
	cout.setf(ios::fixed);
	cout.precision(3);

	int C = 0;
	cin >> C;

	for (int i = 0; i < C; i++)
	{
		int N = 0;
		cin >> N;
		int a[1000] = { 0, };
		double sum = 0;
		double avg = 0;
		double cnt = 0;
		double percent = 0;
		for (int i2 = 0; i2 < N; i2++)
		{
			cin >> a[i2];
			sum += a[i2];
		}
		avg = sum / N;

		for (int i2 = 0; i2 < N; i2++)
		{
			if (a[i2] > avg)
			{
				cnt++;
			}
		}

		percent = cnt / N * 100;
		cout << percent << "%" << endl;

	}
}
