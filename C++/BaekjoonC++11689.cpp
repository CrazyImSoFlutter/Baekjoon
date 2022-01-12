#include <iostream>
#include <vector>
#define ll long long

using namespace std;

ll N, A;
vector<ll> V;

void input() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> N;
    A = N;
}

void solution() {
    for (ll i = 2; i * i <= N; i++) {
        if (N % i == 0) {
            while (N % i == 0) {
                N /= i;
            }
            V.push_back(i);
        }
    }
    if (N != 1) {
        V.push_back(N);
    }
    for (int i = 0; i < V.size(); i++) {
        A /= V[i];
        A *= (V[i] - 1);
    }
    cout << A << '\n';
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
