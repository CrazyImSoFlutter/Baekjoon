#include <iostream>
#include <algorithm>

using namespace std;

int N, K, list[5000001];

bool compare(int a, int b) {
    return a < b;
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    cin >> N >> K;

    for (int i = 0; i < N; i++) {
        cin >> list[i];
    }
    sort(list, list + N, compare);

    cout << list[K - 1];
}