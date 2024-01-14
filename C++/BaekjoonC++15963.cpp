#include <iostream>
using namespace std;

long long N, M;

int main() {
    cin >> N >> M;

    if (N == M)
        cout << 1;
    else
        cout << 0;
}