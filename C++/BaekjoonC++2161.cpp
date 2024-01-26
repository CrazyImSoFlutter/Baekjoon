#include <iostream>
#include <queue>

using namespace std;

int N;
queue<int> q;

int main() {
    cin >> N;

    for (int i = 0; i <= N; i++) {
        q.push(i);
    }

    q.pop();
    while (!q.empty()) {
        cout << q.front() << " ";
        q.pop();
        q.push(q.front());
        q.pop();
    }
}