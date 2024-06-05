#include <iostream>

using namespace std;

int N;
int cnt = 1;

int main() {
    cin >> N;

    N -= 1;
    if (N == 0) {
        cout << cnt;
    }

    while (N) {
        if (N - 6 * cnt <= 0) {
            cnt++;
            cout << cnt;
            break;
        }
        N -= (6 * cnt);
        cnt++;
    }
}