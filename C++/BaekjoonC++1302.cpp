#include <iostream>
#include <map>

using namespace std;

int N, MAX;
map<string, int> m;
string a, answer;

int main(){
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    cin >> N;

    for(int i = 0; i < N; i++) {
        cin >> a;

        if (m.find(a) == m.end())
            m.insert(pair<string ,int>(a, 1));
        else
            m[a]++;
    }

    for (auto& i : m) {
        if (i.second > MAX) {
            answer = i.first;
            MAX = i.second;
        }
    }

    cout << answer << '\n';
}