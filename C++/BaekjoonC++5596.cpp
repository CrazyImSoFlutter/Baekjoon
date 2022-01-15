#include <iostream>

using namespace std;

int main() {
    int a[4];
    int b[4];
    int A, B;

    A = B = 0;
    cin >> a[0] >> a[1] >> a[2] >> a[3];
    cin >> b[0] >> b[1] >> b[2] >> b[3];

    for (int i = 0; i < 4; i++) {
        A += a[i];
        B += b[i];
    }
    cout << (A > B ? A : B);
}
