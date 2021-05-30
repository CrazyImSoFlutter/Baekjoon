#include<iostream>
using namespace std;

int main()
{
	int x;
	int y = 0;
	cin >> x;

	while (x != 0)
	{
		if (x > 64)
		{
			break;
		}
		else
		{
			if (x % 2 == 1)
			{
				y++;
				x = x / 2;
			}
			else if (x % 2 == 0)
			{
				x = x / 2;
			}
		}
		
	}
	cout << y;
}
