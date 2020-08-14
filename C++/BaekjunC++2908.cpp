#include<iostream>
#include<string>
#include<algorithm>
using namespace std;

int main()
{
	string A = " ";
	string B = " ";
	cin >> A;
	cin >> B;

	for (int i = 0; i < A.length() / 2; i++)
	{
		char tmp;
		tmp = A.at(i);
		A.at(i) = A.at(A.length() - i - 1);
		A.at(A.length() - i-1) = tmp;
	}

	for (int i = 0; i < A.length() / 2; i++)
	{
		char tmp;
		tmp = B.at(i);
		B.at(i) = B.at(B.length() - i - 1);
		B.at(B.length() - i - 1) = tmp;
	}

	int maxi = max(stoi(A), stoi(B));

	cout << maxi;


	return 0;
}
