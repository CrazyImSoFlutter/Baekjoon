#include<iostream>
using namespace std;

int main(void)
{
	int a = 0;
	int b = 0;
	int c = 0;

	cin >> a;
	cin >> b;
	cin >> c;

	cout << (a+b)%c << endl << ((a%c) + (b%c))%c << endl << (a*b)%c << endl << ((a%c) * (b%c))%c;
}
