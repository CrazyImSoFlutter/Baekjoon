#include <iostream>
#include <string>

using namespace std;

int main() {
    int T;

    cin >> T;
    while (T--) {
        string a;

        cin >> a;
        if (a.length() == 1) {
            cout << a[0] << a[0] << '\n';
            continue;
        }
        cout << a[0] << a.back() << '\n';
    }
}
