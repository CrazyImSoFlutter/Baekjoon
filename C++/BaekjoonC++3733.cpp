#include <iostream>
using namespace std;

int N, S;

int main() {
    while(cin >> N >> S) {
        cout << S / (N + 1) << '\n';
    }
}