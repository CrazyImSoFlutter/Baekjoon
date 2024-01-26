#include <iostream>

using namespace std;

int N, M, B, W, answer;

int main() {
    cin >> N >> M;

    for (int i = 0; i < N; i++) {
        cin >> B;
        if (W + B > M) {
            answer++;
            W = B;
        } else {
            W += B;
        }
            
    }
    if (W > 0)
        answer++;

    cout << answer;
}