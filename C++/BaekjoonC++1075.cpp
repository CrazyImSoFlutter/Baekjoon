#include <iostream>

using namespace std;

int main() {
    int N, F, tmp;

    cin >> N >> F;
    tmp = N - (N % 100);
    for (int i = 0; i < 100; i++) {
        if ((tmp + i) % F == 0) {
            if (i < 10) {
                cout << 0 << i;
                break;
            } else {
                cout << i;
                break;
            }
        }
    }
    return 0;
}
