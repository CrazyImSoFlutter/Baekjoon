#include<iostream>
#include<vector>
using namespace std;
void hansu(int a, int& count2)
{
	vector <int> num1;
	vector <int> num2;
	int size = 0;
	int count = 0;

	if (a < 10)
	{
		count2++;
	}
	else
	{
		while (a)
		{
			num1.push_back(a % 10);
			a = a / 10;
			size++;
		}
		for (int i = 0; i < size - 1; i++)
		{
			num2.push_back(num1[i] - num1[i + 1]);
		}
		for (int i = 0; i < num2.size() - 1; i++)
		{
			if (num2[i] == num2[i + 1])
			{
				count++;
			}
		}
		if (count == num2.size() - 1)
		{
			count2++;
		}
	}
}

int main()
{
	int N = 0;
	cin >> N;
	int count = 0;
	for (int i = 1; i < N+1; i++)
	{
		hansu(i, count);
	}
	cout << count;
}
