#include <iostream>

using namespace std;

int N, max_value, min_value;
int A[11];
int O[4];

void input() {
    int index;

    index = 0;
    cin >> N;
    for (int i = 0; i < N; i++)
        cin >> A[i];
    cin >> O[0] >> O[1] >> O[2] >> O[3];
 
    min_value = 1000000001;
    max_value = -1000000001;
}

void dfs(int depth, int sum) {
    int cur;

    if (depth == N - 1) {
        max_value = max_value < sum ? sum : max_value;
        min_value = min_value > sum ? sum : min_value;
        return;
    }
    for (int i = 0; i < 4; i++) {
        if (O[i] == 0)
            continue;
        O[i]--;
        if (depth == 0)
            cur = A[0];
        else
            cur = sum;
        switch (i) {
            case 0:
                dfs(depth + 1, cur + A[depth + 1]);
                break;
            case 1:
                dfs(depth + 1, cur - A[depth + 1]);
                break;
            case 2:
                dfs(depth + 1, cur * A[depth + 1]);
                break;
            case 3:
                dfs(depth + 1, cur / A[depth + 1]);
                break;
        }
        O[i]++;
    }
}

void solve() {
    input();
    dfs(0, 0);
    cout << max_value << "\n" << min_value;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(NULL); cout.tie(NULL);
    solve();
}
