#include <iostream>
#include <algorithm>

using namespace std;

int B, C, D, MIN, answer, sum;
int b[1001];
int c[1001];
int d[1001];

bool compare (int a, int b) {
    return a > b;
}

int main() {
    cin >> B >> C >> D;

    for (int i = 0; i < B; i ++) {
        cin >> b[i];
        sum += b[i];
    }

    for (int i = 0; i < C; i ++) {
        cin >> c[i];
        sum += c[i];
    }

    for (int i = 0; i < D; i ++) {
        cin >> d[i];
        sum += d[i];
    }

    sort(b, b + B, compare);
    sort(c, c + C, compare);
    sort(d, d + D, compare);

    MIN = min(min(B, C), D);
    for (int i = 0; i < MIN; i++) {
        answer += b[i];
        answer += c[i];
        answer += d[i];
    }
    answer = answer * 9 / 10;
    
    for (int i = MIN; i < B; i++) {
        answer += b[i];
    }

    for (int i = MIN; i < C; i++) {
        answer += c[i];
    }

    for (int i = MIN; i < D; i++) {
        answer += d[i];
    }

    cout << sum << '\n';
    cout << answer << '\n';
}