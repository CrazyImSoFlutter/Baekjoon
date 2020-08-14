#include<iostream>
using namespace std;

int main()
{
	int A, B, C;
	int mlt;
	int size = 0;
	int n[10] = { 0, 0, };
	cin >> A;
	cin >> B;
	cin >> C;
	mlt = A * B * C;
	int mlt2 = mlt;
	while (mlt > 0)
	{
		mlt = mlt / 10;
		size++;
	}

	for (int i = 0; i < size; i++)
	{
		for (int i2 = 0; i2 < 10; i2++)
		{
			if (mlt2 % 10 == i2)
				n[i2]++;
		}
		mlt2 = mlt2 / 10;
	}

	for (int i = 0; i < 10; i++)
	{
		cout << n[i] << endl;
	}
}
