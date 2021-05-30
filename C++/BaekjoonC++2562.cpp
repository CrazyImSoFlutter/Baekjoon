#include<iostream>
using namespace std;

int main()
{
	int a[9];
	int tmp = 0;
	int cn = 0;

	for (int i = 0; i < 9; i++)
	{
		cin >> a[i];
	}

	for (int i = 0; i < 9; i++)
	{
		if (tmp < a[i])
		{
			tmp = a[i];
			cn = i + 1;
		}
	}

	cout << tmp<<endl << cn;
}
