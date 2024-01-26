#include <iostream>

using namespace std;

int N, R;

int main() {
    cin >> N;
    for (int i = 1; i <= N; i *= 10) 
		R += N - i + 1;

    cout << R;
}