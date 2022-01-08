#include <iostream>

using namespace std;

void solution() {
    int h1, m1, s1, h2, m2, s2;
    int ah, am, as;

    cin >> h1 >> m1 >> s1 >> h2 >> m2 >> s2;
    ah = am = as = 0;
    as = s2 - s1;
    if (as < 0) {
        as = (as + 60) % 60;
        am -= 1;
    }
    am = am + m2 - m1;
    if (am < 0) {
        am = (am + 60) % 60;
        ah -= 1;
    }
    ah = ah + h2 - h1;
    cout << ah << ' ' << am << ' ' << as << '\n';
}

void solve() {
    for (int i = 0; i < 3; i++)
        solution();
}

int main() {
    solve();
}
