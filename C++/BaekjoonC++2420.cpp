#include <iostream>

using namespace std;

int main() {
    long long N, M, answer;

    cin >> N >> M;
    answer = N - M;
    answer >= 0 ? cout << answer : cout << -answer;
}
