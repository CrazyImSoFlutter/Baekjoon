#include <iostream>
#include <algorithm>

using namespace std;

int N, L, fruit[1001];

bool compare(int a, int b) {
    return a < b;
}

int main() {
    cin >> N >> L;

    for (int i = 0; i < N; i++) {
        cin >> fruit[i];
    }

    sort(fruit, fruit + N, compare);

    for (int i = 0; i < N; i++) {
        if (fruit[i] <= L) {
            L++;
        }
    }
    cout << L;
}