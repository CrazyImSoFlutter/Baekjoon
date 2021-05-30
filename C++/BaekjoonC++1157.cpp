#include<iostream>
#include<string>
using namespace std;

int main()
{
	int alphabet[26] = { 0, };
	string S;
	cin >> S;

	for (int i = 0; i < S.length(); i++)
	{
		int a = 0;
		a = S[i];
		for (int i2 = 0; i2 < 26; i2++)
		{
			if (a == 65 + i2 || a == 97 + i2)
				alphabet[i2]++;
		}
	}

	bool confirm = false;

	for (int i = 0; i < 26; i++)
	{
		int a = 0;
		for (int i2 = 0; i2 < 26; i2++)
		{
			if (alphabet[i] > alphabet[i2])
				a++;
		}
		if (a == 25)
		{
			char c(i + 65);
			cout << c;
			confirm = true;
			break;
		}
	}
	if (confirm == false)
	{
		cout << "?";
	}
}
