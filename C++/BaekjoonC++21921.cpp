#include <iostream>

using namespace std;

int N, X, tmp, visitors[250001];
int MAX;
int MAX_COUNT;

int main() {
    cin >> N >> X;

    for (int i = 1; i <= N; i++) {
        cin >> tmp;
        visitors[i] = tmp + visitors[i - 1];
    }

    for (int i = X; i <= N; i++) {
        tmp = visitors[i] - visitors[i - X];

        if (MAX < tmp) {
            MAX = tmp;
            MAX_COUNT = 1;
        } else if (MAX == tmp) {
            MAX_COUNT++;
        }
    }

    if (MAX == 0) {
        cout << "SAD";
    } else {
        cout << MAX << "\n" << MAX_COUNT;
    }
}