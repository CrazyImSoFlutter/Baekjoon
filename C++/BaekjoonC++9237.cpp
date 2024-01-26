#include <iostream>
#include <algorithm>

using namespace std;

int N, answer, tree[1000000];

bool compare(int a, int b) {
    return a > b;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    cin >> N;
    for (int i = 0; i < N; i++) {
        cin >> tree[i];
    }
    sort(tree, tree + N, compare);

    for (int i = 0; i < N; i++) {
        tree[i] += i + 2;
    }

    for (int i = 0; i < N; i++) {
        if (answer < tree[i]) {
            answer = tree[i];
        }
    }
    cout << answer << '\n';
}