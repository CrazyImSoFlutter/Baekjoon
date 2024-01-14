#include<iostream>
using namespace std;

int N, rowCount, colCount;
string map[101];
int main() {
    cin >> N;
    for (int i = 0; i < N; i++) cin >> map[i];

    for (int i = 0; i < N; i++) {
        int sequence = 0;

        for (int j = 0; j < N; j++) {
            if (map[i][j] == '.') {
                sequence++;
                if (j == N - 1 && sequence >= 2) {
                    rowCount++;
                    sequence = 0;
                }
            } else { 
                if (sequence >= 2)
                    rowCount++;
                sequence = 0;
            }
        }
    }

    for (int j = 0; j < N; j++) {
        int sequence = 0;
        
        for (int i = 0; i < N; i++) {
            if (map[i][j] == '.') {
                sequence++;
                if (i == N - 1 && sequence >= 2) {
                    colCount++;
                    sequence = 0;
                }
            } else {
                if (sequence >= 2)
                    colCount++;
                sequence = 0;
            }
        }
    }
    cout << rowCount << " " << colCount << '\n';
}