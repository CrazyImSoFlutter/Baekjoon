#include <iostream>

using namespace std;

int dpA[50];
int dpB[50];

int fiboA(int n) {
    if (n == 0 || n == 1)
        return 0;

    if (dpA[n] != 0) {
        return dpA[n];
    } else {
        dpA[n] = fiboA(n - 1) + fiboA(n - 2);
        return dpA[n];
    }
}

int fiboB(int n) {
    if (n == 0)
        return 0;
    if (n == 1)
        return 1;

    if (dpB[n] != 0) {
        return dpB[n];
    } else {
        dpB[n] = fiboB(n - 1) + fiboB(n - 2);
        return dpB[n];
    }
}

int N;

int main() {
    dpA[1] = 0;
    dpA[2] = 1;
    dpB[1] = 1;
    dpB[2] = 1;

    cin >> N;

    cout << fiboA(N) << " " << fiboB(N);
}