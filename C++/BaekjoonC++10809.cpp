#include<iostream>
#include<string>
using namespace std;

int main()
{
	string S;
	int k[100] = { 0, };
	cin >> S;
	for (int i = 0; i < 26; i++)
	{
		for (int i2 = 0; i2 < S.length(); i2++)
		{
			int a = 97 + i;
			if (a == S.at(i2))
			{
				k[i] = i2;
				break;
			}
			else if ( a != S.at(i2))
			{
				k[i] = -1;
			}
		}
		cout << k[i] << " ";
	}
}
