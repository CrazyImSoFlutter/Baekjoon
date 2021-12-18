#include <iostream>
#include <string>
using namespace std;

string S1, S2;
int answer;

void input() {
    getline(cin, S1);
    getline(cin, S2);
}

void solution() {
    int S1_size, S2_size, flag;

    S1_size = S1.size();
    S2_size = S2.size();
    for (int i = 0; i < S1_size - S2_size + 1; i++) {
        flag = 1;
        if (S1[i] == S2[0] && S1[i + S2_size - 1] == S2[S2_size - 1]) {
            for (int j = 0; j < S2_size; j++) {
                if (S1[i + j] != S2[j]) {
                    flag = 0;
                    break;
                }
            }
            if (flag == 1) {
                answer++;
                i += (S2_size - 1);
            }
        }
    }
    cout << answer;
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
