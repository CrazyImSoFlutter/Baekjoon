#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;

int N, C, W, tree[50];
long long answer;

bool compare(int a, int b) {
    return a > b;
}

int main() {
    cin >> N >> C >> W;

    for (int i = 0; i < N; i++) {
        cin >> tree[i];
    }

    sort(tree, tree + N, compare);

    for (int i = 1; i <= tree[0] + 1; i++) {
        long long sum = 0;

        for (int j = 0; j < N; j++) {
            int cut = tree[j] / i;
            int r = tree[j] % i;
            sum += max(0, r ? (cut * i * W - cut * C) : (cut * i * W - (cut - 1) * C));
        }
        answer = max(answer, sum);
    }
    cout << answer << '\n';
}