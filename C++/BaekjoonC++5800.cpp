#include <iostream>
#include <algorithm>

using namespace std;

int K, N[101];
int Classes[101][51];
int gap[101];

bool compare(int a, int b) {
    return a > b;
}

int main() {
    cin >> K;

    for(int i = 0; i < K; i++) {
        cin >> N[i];
        for (int j = 0; j < N[i]; j++) {
            cin >> Classes[i][j];
        }
    }
    for(int i = 0; i < K; i++) {
        sort(Classes[i], Classes[i] + N[i], compare);
    }
    for (int i = 0; i < K; i++) {
        for (int j = 0; j < N[i] - 1; j++) {
            if (Classes[i][j] - Classes[i][j + 1] > gap[i]) {
                gap[i] = Classes[i][j] - Classes[i][j + 1];
            }
        }
    }
    for (int i = 0; i < K; i++) {
        cout << "Class " << i + 1 << '\n';
        cout << "Max " << Classes[i][0] << ", Min " << Classes[i][N[i] - 1] << ", Largest gap " << gap[i] << '\n'; 
    }
}