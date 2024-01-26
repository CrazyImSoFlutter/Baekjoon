#include <iostream>

using namespace std;

int N, answer, ropes[10001];

bool compare(int a, int b) {
    return a > b;
}

int main() {
    cin >> N;

    for (int i = 0; i < N; i++) {
        int a;

        cin >> a;
        ropes[a]++;
    }

    for (int i = 0; i < 10001; i++) {
        if (ropes[i] != 0) {
            if (N * i > answer) {
                answer = N * i;
            }
            N -= ropes[i];
        }
    }
    cout << answer;
}