#include <iostream>
#include <algorithm>
#include <vector>
#include <cmath>
#include <set>

using namespace std;

#define INF (1 << 30)
typedef pair<int, int> pa;

int n;
vector<pa> v;
set<pa> s;

int dist(pa a, pa b) {
    int x = (a.first - b.first) * (a.first - b.first);
    int y = (a.second - b.second) * (a.second - b.second);
    
    return x + y;
}

void input() {
    int x, y;

    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> x >> y;
        v.push_back(make_pair(x, y));
    }
}

void solution() {
    int mini, idx;

    sort(v.begin(), v.end());
    s.insert(make_pair(v[0].second, v[0].first));
    s.insert(make_pair(v[1].second, v[1].first));

    mini = dist(v[0], v[1]);
    idx = 0;

    for (int i = 2; i < n; i++) {
        while (idx < i) {
            int d;

            d = v[i].first - v[idx].first;
            if (d * d <= mini)
                break;
            else {
                s.erase(make_pair(v[idx].second, v[idx].first));
                idx++;
            }
        }
        auto start = s.lower_bound(make_pair(v[i].second - sqrt(mini), -INF));
        auto end = s.upper_bound(make_pair(v[i].second + sqrt(mini), INF));
        for (auto it = start; it != end; it++)
            mini = min(mini, dist(make_pair(it->second, it->first), v[i]));
        s.insert(make_pair(v[i].second, v[i].first));
    }
    cout << mini << "\n";
}

void solve() {
    input();
    solution();
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    solve();
}
