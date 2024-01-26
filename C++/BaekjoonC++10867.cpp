#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

vector<int> v;
int N;

bool compare (int a, int b) {
    return a < b;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    cin >> N;

    for (int i = 0; i < N; i++) {
        int a;

        cin >> a;
        v.push_back(a);
    }
    sort(v.begin(), v.end(), compare);
    v.erase(unique(v.begin(), v.end()), v.end());
    

    for (int i = 0; i < v.size(); i++) {
        cout << v[i] << " ";
    }
}