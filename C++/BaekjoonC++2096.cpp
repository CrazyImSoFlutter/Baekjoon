#include <iostream>

using namespace std;

int N;
int maxDP[3];
int minDP[3];

int main() {
    cin >> N;

    cin >> maxDP[0] >> maxDP[1] >> maxDP[2];
    minDP[0] = maxDP[0];
    minDP[1] = maxDP[1];
    minDP[2] = maxDP[2];

    for (int i = 1; i < N; i++) {
        int one, two, three;

        cin >> one >> two >> three;

        int tmp1 = maxDP[0]; 
        int tmp2 = maxDP[2];
        maxDP[0] = max(maxDP[0], maxDP[1]) + one;
        maxDP[2] = max(maxDP[1], maxDP[2]) + three;
        maxDP[1] = max(max(tmp1, maxDP[1]), tmp2) + two;
        
        tmp1 = minDP[0];
        tmp2 = minDP[2];
        minDP[0] = min(minDP[0], minDP[1]) + one;
        minDP[2] = min(minDP[1], minDP[2]) + three;
        minDP[1] = min(min(tmp1, minDP[1]), tmp2) + two;
    }

    cout << max(max(maxDP[0], maxDP[1]), maxDP[2]) << " ";
    cout << min(min(minDP[0], minDP[1]), minDP[2]);
}