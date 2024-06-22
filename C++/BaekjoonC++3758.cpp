#include <iostream>
#include <utility>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int T, n, k, t, m;

bool compare(pair<int, pair<int, pair<int, int> > > a, pair<int, pair<int, pair<int, int> > > b) {
    if (a.first == b.first) {
        if (a.second.first == b.second.first) {
            if (a.second.second.first == b.second.second.first) {
                return a.second.second.second < b.second.second.second;
            }
            return a.second.second.first < b.second.second.first;
        }
        return a.second.first < b.second.first;
    }
    return a.first > b.first;
}

void solve() {
    int arr[101][101] = {0, };
    int submit_count[101] = {0, };
    int score[101] = {0, };
    int time[101] = {0, };
    vector <pair<int, pair<int, pair<int, int> > > > v;

    cin >> n >> k >> t >> m;

    for (int i = 0; i < m; i++) {
        int a, b, c;

        cin >> a >> b >> c;
        if (arr[a][b] < c) {
            score[a] -= arr[a][b];
            score[a] += c;
            arr[a][b] = c;
        }
        submit_count[a]++;
        time[a] = i;
    }

    for (int i = 1; i <= n; i++) {
        v.push_back(make_pair(score[i], make_pair(submit_count[i], make_pair(time[i], i))));
    }

    sort(v.begin(), v.end(), compare);
    for (int i = 0; i < v.size(); i++) {
        if (v[i].second.second.second == t) {
            cout << i + 1 << '\n';
            return;
        }
    }
}

int main() {
    cin >> T;

    for (int i = 0; i < T; i++) {
        solve();
    }
}