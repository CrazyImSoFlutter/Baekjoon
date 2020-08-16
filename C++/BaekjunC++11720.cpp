#include<iostream>
#include<string>
using namespace std;

int main()
{
	int N;
	cin >> N;
	string M;
	cin >> M;
	int sum = 0;
	for (int i = 0; i < N; i++)
	{
		int k = M.at(i) - '0';
		sum += k;
	}

	cout << sum;
}
