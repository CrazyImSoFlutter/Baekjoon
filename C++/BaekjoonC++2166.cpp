#include <stdio.h>
#include <utility>
#include <algorithm>

using namespace std;

int N;
double A, B;
pair<int, int> point[10001];

void input() {
    double x, y;

    scanf("%d", &N);
    for (int i = 0; i < N; i++) {
        scanf("%lf %lf", &x, &y);
        point[i] = make_pair(x, y);
    }
    point[N] = point[0];
}

void solve() {
    double x, y;

    for (int i = 0; i < N; i++) {
        x = point[i].first;
        y = point[i + 1].second;

        A += x * y;
    }
    for (int i = 0; i < N; i++) {
        x = point[i + 1].first;
        y = point[i].second;

        B += x * y;
    }
    printf("%.1lf", abs(A - B) / 2);
}

int main() {
    input();
    solve();
}
