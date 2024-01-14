#include <iostream>

using namespace std;

int T, A, B;
int main() {
    cin >> T;
    for (int i = 0; i < T; i++) {
        cin >> A >> B;
        cout << A + B << '\n';
    }
}