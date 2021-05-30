#include<iostream>
#include<string>
using namespace std;

int main()
{
	int N = 0;
	int sum[100] = { 0, };
	cin >> N;

	for (int i = 0; i < N; i++)
	{
		int cnt = 0;
		string OX;
		cin >> OX;
		for (int i2 = 0; i2 < OX.length(); i2++)
		{
			if (OX.at(i2) == 'O')
			{
				cnt++;
				sum[i] += cnt;
			}
			else if(OX.at(i2) == 'X')
			{
				cnt = 0;
			}
		}
		cout << sum[i] << endl;
	}
}
