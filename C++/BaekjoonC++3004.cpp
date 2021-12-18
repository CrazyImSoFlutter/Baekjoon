#include <iostream>

using namespace std;

int main() {
    int N, row, col, result;

    cin >> N;
    row = N / 2 + 1;
    col = N - row + 2;
    cout << row * col;
}
