#include <iostream>
#include <algorithm>
#include <math.h>
#include<stdio.h>
using namespace std;

int main()
{
	int map[10][10], n, m;

	cin >> n >> m;
	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < m; ++j)
		{
			scanf("%1d", &map[i][j]);
		}
	}
	int answer = -1;

	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < m; ++j)
		{
			for (int i2 = -n; i2 < n; ++i2)
			{
				for (int j2 = -m; j2 < m; ++j2)
				{
					if (i2 == 0 && j2 == 0)
					{
						continue;
					}

					int t = 0, x = i, y = j;
					while (x >= 0 && x < n && y >= 0 && y < m)
					{
						t = 10 * t + map[x][y];
						if (fabs(sqrt(t) - (int)sqrt(t)) < 1e-10)
						{
							answer = max(answer, t);
						}
						x += i2;
						y += j2;
					}
				}
			}
		}
	}
	cout << answer << '\n';
	return 0;
}
