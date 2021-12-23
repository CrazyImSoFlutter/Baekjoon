#include <iostream>
#include <deque>
#include <utility>

using namespace std;

int D[5000000];
int N, L;
deque<pair<int, int> > DQ;

void input() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cin >> N >> L;
    for (int i = 0; i < N; i++)
        cin >> D[i];
}

void solution() {
    for (int i = 0; i < N; i++) {
        if (DQ.empty() == 0 && DQ.front().second <= i - L)
            DQ.pop_front();

        while (DQ.empty() == 0 && DQ.back().first > D[i])
            DQ.pop_back();

        DQ.push_back({D[i], i});
        cout << DQ.front().first << " ";
    }
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
