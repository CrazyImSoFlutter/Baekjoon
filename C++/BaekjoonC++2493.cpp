#include <iostream>
#include <utility>
#include <stack>
 
using namespace std;

int N, H;
int main() {
    cin.tie(0);
    ios_base::sync_with_stdio(false);
 
    stack<pair<int, int> > s;
    
    cin >> N;
 
    for (int i = 0; i < N; i++) {
        cin >> H;
 
        while (!s.empty()) {
            if (H < s.top().second) {
                cout << s.top().first << " ";
                break;
            }
            s.pop();
        }
        if (s.empty()) {
            cout << 0 << " ";
        }
        s.push(make_pair(i + 1, H));
    }
}  