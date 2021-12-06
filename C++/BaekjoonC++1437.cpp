#include <iostream>

using namespace std;

int N;
long long answer;

int main() {
    cin >> N;
    answer = 1;

    while (N >= 5) {
        answer = (3 * answer) % 10007;
        N -= 3;
    }
    cout << (answer * N) % 10007 << endl;
}
