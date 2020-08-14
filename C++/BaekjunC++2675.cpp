#include<iostream>
#include<string>
using namespace std;

int main()
{
	int T, R;
	string S;
	cin >> T;
	for (int i = 0; i < T; i++)
	{
		char AS[1000] = {0, };
		cin >> R;
		cin >> S;
		for (int i2 = 0; i2 < S.length(); i2++)
		{
			char tmp = S.at(i2);
			for (int i3 = 0; i3 < R; i3++)
			{
				AS[i2 * R + i3] = tmp;
			}
		}

		for (int i2 = 0; i2 < S.length() * R; i2++)
		{
			cout << AS[i2];
		}
		cout << endl;
		
	}
	
}
