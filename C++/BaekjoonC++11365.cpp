#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

int main() {
    while (1) {
        string a;

        getline(cin, a);
        if (a == "END")
            break;
        reverse(a.begin(), a.end());
        cout << a << '\n';
    }
}
