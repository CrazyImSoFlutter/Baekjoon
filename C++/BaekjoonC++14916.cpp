#include <iostream>

using namespace std;

int N, answer, change;

int main() {
    cin >> N;

    answer = N / 5;
    change = N % 5;

    if (N < 5) {
        if (N % 2 == 0) {
            cout << N / 2;
        } else {
            cout << -1;
        }
    } else if (change % 2 != 0) {
        change += 5;
        answer--;
        answer += change / 2;
        cout << answer;
    } else {
        answer += change / 2;
        cout << answer;
    }
}