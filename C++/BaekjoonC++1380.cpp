#include <iostream>
#include <string.h>

using namespace std;

int main() {
	int t;

	t = 0;
	while (1) {
		int n;
		string name[101];
		bool check[101];

		t++;
		cin >> n;
		if (n == 0)
			break ;
		cin.ignore();
		for (int i = 1; i <= n; i++) {
			getline(cin, name[i]);
			check[i] = false;
		}
		for (int i = 1; i <= (2 * n - 1); i++) {
			int a;
			char b;

			cin >> a;
			cin >> b;
			check[a] = !check[a];
		}
		for (int i = 1; i <= n; i++) {
			if (check[i] == true) {
				cout << t << ' ' << name[i] << '\n';
				break ;
			}
		}
	}
}
