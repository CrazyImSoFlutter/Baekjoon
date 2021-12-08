#include <iostream>
#include <vector>
#include <math.h>
#include <algorithm>

using namespace std;

int G;
vector<int> answer;

void input() {
    cin >> G;
}

void solution() {
    for (int i = 1; i < G; i++) {
        int left = i;
        int right = G;
        int middle;
        long long left_p = pow(i, 2);

        while (left <= right) {
            middle = (left + right) / 2;
            long long middle_p = pow(middle, 2);

            if (middle_p - left_p > G) {
                right = middle - 1;
            } else if (middle_p - left_p < G) {
                left = middle + 1;
            } else {
                answer.push_back(middle);
                break;
            }
        }
    }

    if (answer.empty()) {
        cout << -1 << "\n";
        return ;
    }
    sort(answer.begin(), answer.end());
    for (vector<int>::iterator ptr = answer.begin(); ptr != answer.end(); ptr++)
        cout << *ptr << "\n";
}

void solve() {
    input();
    solution();
}

int main() {
    solve();
}
