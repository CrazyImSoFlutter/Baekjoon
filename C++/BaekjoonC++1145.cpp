#include <iostream>
#include <algorithm>

using namespace std;

int N[5];
int answer;

int gcd(int a, int b) {
    if (b == 0)
        return a;
    else
        return gcd(b, a % b);
}

int lcm(int a, int b, int c) {
    int tmp;

    tmp = a * b / gcd(a, b);
    tmp = tmp * c / gcd(tmp, c);
    return tmp;
}

void input() {
    for (int i = 0; i < 5; i++)
        cin >> N[i];
    answer = 2100000000;
}

void solve() {
    for (int i = 0; i < 5; i++) {
        for (int j = i + 1; j < 5; j++) {
            for (int k = j + 1; k < 5; k++) {
                answer = min(answer, lcm(N[i], N[j], N[k]));
            }
        }
    }
    cout << answer << "\n";
}

int main() {
    input();
    solve();
}
