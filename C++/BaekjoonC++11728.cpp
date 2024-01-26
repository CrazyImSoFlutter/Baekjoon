#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

vector<int> v1, v2;
int N, M;

bool compare (int a, int b) {
    return a < b;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    cin >> N >> M;

    for (int i = 0; i < N; i++) {
        int a;

        cin >> a;
        v1.push_back(a);
    }

    for (int i = 0; i < M; i++) {
        int a;

        cin >> a;
        v2.push_back(a);
    }


    int i = 0, j = 0;
    while (i < N && j < M) {
        if (v1[i] < v2[j]) {
            cout << v1[i++] << " ";
        } else {
            cout << v2[j++] << " ";
        }
    }

    while (i < N) cout << v1[i++] << " ";
    while (j < M) cout << v2[j++] << " ";
}