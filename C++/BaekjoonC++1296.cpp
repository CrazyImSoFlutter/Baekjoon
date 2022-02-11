#include <iostream>
#include <string.h>
#include <algorithm>

using namespace std;

int main() {
	string green;
	string team[50];
	string A;
	int N, M, T;
	int L, O, V, E;
	int l, o, v, e;

	cin >> green >> N;
	L = O = V = E = 0;
	M = -1;
	for (int i = 0; i < green.length(); i++) {
		switch (green[i]) {
			case 'L':
				L++;
				break;
			case 'O':
				O++;
				break;
			case 'V':
				V++;
				break;
			case 'E':
				E++;
				break;
			default:
				break;
		}
	}
	for (int i = 0; i < N; i++)
		cin >> team[i];
	sort(team, team + N);
	for (int i = 0; i < N; i++) {
		l = o = v = e = 0;
		for (int j = 0; j < team[i].length(); j++) {
			switch (team[i][j]) {
				case 'L':
					l++;
					break;
				case 'O':
					o++;
					break;
				case 'V':
					v++;
					break;
				case 'E':
					e++;
					break;
				default:
					break;
			}
		}
		T = ((L + l + O + o) * 
				(L + l + V + v) * 
				(L + l + E + e) * 
				(O + o + V + v) * 
				(O + o + E + e) * 
				(V + v + E + e)) % 100;
		if (T > M) {
			M = T;
			A = team[i];
		}
	}
	cout << A;
}
