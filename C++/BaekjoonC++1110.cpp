#include<iostream>
#include<ios>
using namespace std;

int main()
{
	cin.tie(NULL);
	ios::sync_with_stdio(false);
	int a, b, c, d = 0;
	int e= 0;
	cin >> a;
	e = a;
	while (1)
	{

		b = a / 10 + a % 10;
		c = (a % 10) * 10 + b % 10;
		d++;
		if (e == c)
		{
			cout << d;
			break;
		}
		else if (e != c)
		{
			a = c;
		}
	}
	
}
