#include <iostream>
using namespace std;

int N;
string map[1001];
int answerMap[1001][1001];
string finalMap[1001][1001];

int main() {
    cin >> N;
    for (int i = 0; i < N; i++) cin >> map[i];

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (map[i][j] != '.') {
                for (int k = -1; k < 2; k++) {
                    for (int l = -1; l < 2; l++) {
                        if (i + k < 0 || i + k >= N || j + l < 0 || j + l >= N) continue;
                        answerMap[i + k][j + l] += (map[i][j] - '0');
                    }
                }
            }
        }
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (map[i][j] != '.') finalMap[i][j] = "*";
            else if (answerMap[i][j] >= 10) finalMap[i][j] = "M";
            else finalMap[i][j] = answerMap[i][j] + '0';
        }
    }

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << finalMap[i][j];
        } 
        cout << '\n';
    }
}