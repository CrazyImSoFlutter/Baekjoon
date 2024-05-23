#include <iostream>

using namespace std;

int a, b, c;

int main() {
    while (true) {
        cin >> a >> b >> c;

        int m = max(a, max(b, c));

        if (a == b && b == c && c == 0) {
            break;
        }

        if (m >= (a + b + c - m)) {
            cout << "Invalid\n";
            continue;
        }

        if (a == b && b == c) {
            cout << "Equilateral\n";
            continue;
        }

        if ((a == b && b != c) || (a == c && b != c) || (b == c && a != c)) {
            cout << "Isosceles\n";
            continue;
        }

        cout << "Scalene\n";
    }
}