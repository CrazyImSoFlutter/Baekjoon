#include<iostream>
using namespace std;

int main()
{
	int n[10];
	int n2[10];
	int chk[42] = {0, };
	int size = 0;
	for (int i = 0; i < 10; i++)
	{
		cin >> n[i];
		n2[i] = n[i] % 42;
	}
	for (int i = 0; i < 10; i++)
	{
		for (int i2 = 0; i2 < 42; i2++)
		{
			if (n2[i] == i2 && chk[i2] == 0)
			{
				chk[i2] = 1;
			}
		}
	}
	for (int i = 0; i < 42; i++)
	{
		size += chk[i];
	}
	cout << size;
}
