#include <iostream>
#include <cmath>

using namespace std;

long long A, B, N, numA, cnt, numB[200];

int main() {
    cin >> A >> B >> N;

    for (int i = 1; i <= N; i++) {
        int a;

        cin >> a;
        numA += a * pow(A, N - i);
    }

    while (numA != 0) {
        numB[cnt] = numA % B;
        cnt++;
        numA /= B;
    }

    for (int i = cnt - 1; i >= 0; i--) {
        cout << numB[i] << " ";
    }
}