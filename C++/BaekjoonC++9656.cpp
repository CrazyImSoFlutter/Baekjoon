#include <iostream>

using namespace std;

int N;

int main() {
    cin >> N;

    if (N % 2 == 0) {
        cout << "SK";
    } else {
        cout << "CY";
    }
}