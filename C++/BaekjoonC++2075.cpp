#include <iostream>
#include <queue>
#include <vector>

using namespace std;

int N;
priority_queue<int, vector<int>, greater<int> > pq;

void sol(int n) {

}

int main () {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);

    int tmp;
    cin >> N;

    for(int i = 0; i < N * N; i++) {
        cin >> tmp;
        pq.push(tmp);
        if (pq.size() > N) {
            pq.pop();
        }
    }
    cout << pq.top();
}