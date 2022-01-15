#include <iostream>
#include <string>
#include <climits>
#include <algorithm>
#define MAX 10000000

using namespace std;

string S, W[50];
int N, DP[51];

void input() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> S >> N;
    for (int i = 0; i < N; i++)
        cin >> W[i];
    for (int i = 0; i < 51; i++)
        DP[i] = -1;
}

int cost(string a, string b) {
    string tmp_a, tmp_b;
    int ret;

    if (a.size() != b.size())
        return MAX;
    tmp_a = a;
    tmp_b = b;
    sort(tmp_a.begin(), tmp_a.end());
    sort(tmp_b.begin(), tmp_b.end());
    if (tmp_a != tmp_b)
        return MAX;
    ret = 0;
    for (int i = 0; i < a.size(); i++) {
        if (a[i] != b[i])
            ret++;
    }
    return ret;
}

int solution(int n) {
    if (n == S.size())
        return 0;
    if (DP[n] != -1)
        return DP[n];
    DP[n] = MAX;
    for (int i = n; i < S.size(); i++) {
        string tmp;
        int c;
            
        tmp = S.substr(n, i - n + 1);
        c = MAX;
        for (int j = 0; j < N; j++)
            c = min(c, cost(tmp, W[j]));
        if (c == MAX)
            continue;
        DP[n] = min(DP[n], c + solution(i + 1));
    }
    return DP[n];
}

void solve() {
    int a;

    input();
    a = solution(0);
    cout << (a == MAX ? -1 : a);
}

int main() {
    solve();
}
