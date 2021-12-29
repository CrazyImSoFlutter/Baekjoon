#include <iostream>

using namespace std;

int score() {
    int tmp, sum;

    sum = 0;
    for (int i = 0; i < 4; i++) {
        cin >> tmp;
        sum += tmp;
    }
    return sum;
}

int main() {
    int answer, rank;

    answer = 0;
    for (int i = 0; i < 5; i++) {
        int tmp;

        tmp = score();
        if (answer < tmp) {
            rank = i + 1;
            answer = tmp;
        }
    }
    cout << rank << ' ' << answer;
}
