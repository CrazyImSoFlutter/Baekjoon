#include<iostream>
using namespace std;


int a, b, c, d, area, areaMap[101][101];

int main() {
	for (int i = 0; i < 4; i++) {
		cin >> a >> b >> c >> d;
		for (int y = b; y < d; y++) {
			for (int x = a; x < c; x++) {
				if (!areaMap[y][x]) {
					area++;
					areaMap[y][x] = 1;
				}
			}
		}

	}
	cout << area << endl;
}