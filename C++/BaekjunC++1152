#include<iostream>
#include<string>
using namespace std;

int main()
{
	string line;
	getline(cin, line, '\n');
	int n = 1;
	for (int i = 0; i < line.length(); i++)
	{
		if (i != 0 )
		{
			if(line.at(i)==' ' && i !=line.length()-1)
			n++;
		}
		else if (line.at(0) == ' ')
		{
			if (line.length() == 1)
				n = 0;
		}
		
	}
	cout << n;
	return 0;
}
