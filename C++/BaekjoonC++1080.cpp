#include <iostream>
using namespace std;

int N, M, answer;
string matrixA[50];
string matrixB[50];

void flip(string a[], string b[]) {

}

int main() {
    cin >> N >> M;

    for (int i = 0; i < N; i++) {
        cin >> matrixA[i];
    }
    for (int i = 0; i < N; i++) {
        cin >> matrixB[i];
    }

    if (N >= 3 && M >= 3) {
        for (int i = 0; i < N - 2; i++) {
            for (int j = 0; j < M - 2; j++) {
                if (matrixA[i][j] != matrixB[i][j]) {
                    answer++;
                    for (int k = 0; k < 3; k++) {
                        for (int l = 0; l < 3; l++) {
                            if (matrixA[i + k][j + l] == '0')
                                matrixA[i + k][j + l] = '1';
                            else if (matrixA[i + k][j + l] == '1')
                                matrixA[i + k][j + l] = '0';
                        }
                    }
                }
            }
        }
    }

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            if (matrixA[i][j] != matrixB[i][j]) {
                cout << -1 << '\n';
                return 0;
            }
        }
    }
    cout << answer << '\n';
}