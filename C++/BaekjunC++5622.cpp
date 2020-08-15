#include<iostream>
#include<string>
using namespace std;

int main()
{
	string code;
	cin >> code;
	int sum = 0;
	for (int i = 0; i < code.length(); i++)
	{
		for (int i2 = 0; i2 < 5; i2++)
		{
			if (code.at(i) == 65 + i2*3 || code.at(i) == 66 + i2*3 || code.at(i) == 67 + i2*3)
			{
				sum += 3 + i2;
			}
		}
		
		if (code.at(i) == 80 || code.at(i) == 81 || code.at(i) == 82 || code.at(i) == 83)
		{
			sum += 8;
		}

		if (code.at(i) == 84 || code.at(i) == 85 || code.at(i) == 86 )
		{
			sum += 9;
		}

		if (code.at(i) == 87 || code.at(i) == 88 || code.at(i) == 89 || code.at(i) == 90)
		{
			sum += 10;
		}
	}

	cout << sum;
}
