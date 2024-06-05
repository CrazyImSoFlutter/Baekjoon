#include <iostream>
#include <stack>

using namespace std;

int n, answer;

int main() {
    stack<int> height;

    cin >> n;
    for (int i = 0; i <= n; i++) {
        int x, y;

        if (i == n) {
            y = 0;
        } else {
            cin >> x >> y;
        }

        while (!height.empty() && height.top() >= y) {
            if (height.top() != y) {
                answer++;
            }
            height.pop();
        }
        height.push(y);
    }
    cout << answer;
}