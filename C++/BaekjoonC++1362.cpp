#include <iostream>

using namespace std;

int main() {
	int o, w, n, t;
	char c;
	bool dead;
	
	t = 0;
	while (1) {
		++t;
		cin >> o >> w;
		if (o == 0 && w == 0)
			break ;
		dead = false;
		while (1) {
			cin >> c;
			cin >> n;
			if (!dead) {
				if (c == 'E') {
					w -= n;
					if (w <= 0)
						dead = true;
				} else if (c == 'F')
					w += n;
			}
			if (c == '#')
				break ;
		}
		if (w <= 0)
			cout << t << " RIP\n";
		else if (w > o / 2 && w < 2 * o)
			cout << t << " :-)\n";
		else
			cout << t << " :-(\n";
	}
}
