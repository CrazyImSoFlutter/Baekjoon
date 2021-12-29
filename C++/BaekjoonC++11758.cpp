#include <iostream>

using namespace std;

int main() {
    int x1, y1, x2, y2, x3, y3;
    int o;

    cin >> x1 >> y1 >> x2 >> y2 >> x3 >> y3;
    o = (x1 * y2 - x2 * y1 + x2 * y3 - x3 * y2 + x3 * y1 - x1 * y3) / 2;
    if (o > 0)
        cout << 1 << '\n';
    else if (o < 0)
        cout << -1 << '\n';
    else
        cout << '0' << '\n';
}
