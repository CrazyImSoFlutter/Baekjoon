#include <iostream>
#include <string>

using namespace std;

int month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
string day[] = {"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"};

int main() {
    int x, y, d;

    cin >> x >> y;
    d = 0;
    for (int i = 0; i < x - 1; i++) {
        d += month[i];
    }
    d += y;
    cout << day[d % 7];
}
