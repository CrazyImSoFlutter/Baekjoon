#include <iostream>
#include <string>
using namespace std;

int main() {
    string A, B;
    char result[10005] = {};
    int A_size, B_size, R_size;

    cin >> A >> B;
    A_size = A.length() - 1;
    B_size = B.length() - 1;
    R_size = 0;
    for (R_size = 0; A_size >= 0 || B_size >= 0; R_size++) {
        if (A_size >= 0)
            result[R_size] += A[A_size--] - '0';
        if (B_size >= 0)
            result[R_size] += B[B_size--] - '0';
        
        result[R_size + 1] += result[R_size] / 10;
        result[R_size] %= 10;
    }
    if (result[R_size] == 0)
        R_size--;
    for (; R_size >= 0; R_size--) {
        cout << char(result[R_size] + '0');
    }
}
