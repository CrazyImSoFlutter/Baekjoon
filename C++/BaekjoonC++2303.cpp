#include <iostream>

using namespace std;

int N, card[1001][5];
int MAX, answer;

int main() {
    cin >> N;

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < 5; j++) {
            cin >> card[i][j];
        }

        for (int k = 0; k < 5; k++) {
            for (int l = k + 1; l < 5; l++) {
                for (int m = l + 1; m < 5; m++) {
                    int sum = 0;

                    sum = card[i][k] + card[i][l] + card[i][m];
                    if (sum % 10 >= MAX) {
                        MAX = sum % 10;
                        answer = i;
                    }
                }
            }
        }
    }
    cout << answer + 1;
}