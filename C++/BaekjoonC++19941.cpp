#include <iostream>

using namespace std;

int N, K, answer;
string S;
bool check[20001];

int main() {
    cin >> N >> K;
    cin >> S;

    for (int i = 0; i < N; i++) {
        bool flag = false;

        if (S[i] == 'H') {
            int l, r;

            if (i - K < 0) {
                l = 0;
            } else {
                l = i - K;
            }
            for (int j = l; j <= i - 1; j++) {
                if (S[j] == 'P' && check[j] == false) {
                    answer++;
                    check[j] = true;
                    flag = true;
                    break;
                }
            }

            if (flag) {
                continue;
            }

            if (i + K >= N) {
                r = N - 1;
            } else {
                r = i + K;
            }
            for (int j = i + 1; j <= r; j++) {
                if (S[j] == 'P' && check[j] == false) {
                    answer++;
                    check[j] = true;
                    break;
                }
            }
        }
    }
    cout << answer;
}