#include <iostream>
#include <algorithm>

using namespace std;

int N, list[1000001];

bool compare(int a, int b) {
    return a > b;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    cin >> N;

    for (int i = 0; i < N; i++) {
        cin >> list[i];
    }

    sort(list, list + N, compare);

    for (int i = 0; i < N; i++) {
        cout << list[i] << '\n';
    }
}