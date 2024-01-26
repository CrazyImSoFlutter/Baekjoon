#include <iostream>

using namespace std;

int N, answer, M[10000001];

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    cin >> N;

    for (int i = 0; i < N; i++) {
        int a;

        cin >> a;
        M[a]++;
        if (M[a] == 2)
        answer = a;
    }

    cout << answer;
}