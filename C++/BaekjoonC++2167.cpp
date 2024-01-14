#include <iostream>
using namespace std;

int N, M, K, arr[301][301];

int main() {
    cin >> N >> M;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < M; j++)
            cin >> arr[i + 1][j + 1];

    cin >> K;
    for (int k = 0; k < K; k++) {
        int sum = 0;
        int i, j, x, y;

        cin >> i >> j >> x >> y;
        for (int startY = i; startY <= x; startY++) {
            for (int startX = j; startX <= y; startX++) {
                sum += arr[startY][startX];
            }
        }
        cout << sum << '\n';
    }
}