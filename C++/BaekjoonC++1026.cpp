#include <iostream>
#include <algorithm>
using namespace std;

int main()
{
	int N;
	cin >> N;

	int A[50];
	int B[50];
	int chk[50] = { 0, };

	for (int i = 0; i < N; i++)
	{
		cin >> A[i];
	}
	for (int i = 0; i < N; i++)
	{
		cin >> B[i];
	}

	chk[N] = { 0, };
	sort(A, A + N);
	int S = 0;
	for (int i = 0; i < N; i++)
	{
		int tmp = 0;
		int arraynumber = 0;
		for (int i = 0; i < N; i++)
		{
			if (tmp < B[i] && chk[i] == 0)
			{
				tmp = B[i];
				arraynumber = i;
			}
		}
		chk[arraynumber] = 1;
		S += A[i] * tmp;
	}

	cout << S;
	return 0;
}
