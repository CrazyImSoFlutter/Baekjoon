#include <iostream>
using namespace std;

int N;

int main() {
    while(true) {
        int sum = 0;
        cin >> N;

        if (N == 0) break;
        for (int i = 0; i <= N; i++) {
            sum += i;
        }
        cout << sum << '\n';
    }
}