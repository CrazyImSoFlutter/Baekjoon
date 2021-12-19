#include <iostream>

using namespace std;

int main() {
    int L, A, B, C, D;
    int p, q;

    cin >> L >> A >> B >> C >> D;
    if (A % C != 0)
        p = A / C + 1;
    else
        p = A / C;
    if (B % D != 0)
        q = B / D + 1;
    else
        q = B / D;
    p > q ? cout << L - p : cout << L - q;
}
