#include <iostream>
#include <cmath>

using namespace std;

int N, M, MAX, budget[100001];
int answer = 0;

int main() {
    cin >> N;

    for (int i = 0; i < N; i++)  {
        cin >> budget[i];
        MAX = max(budget[i], MAX);
    }

    cin >> M;

    int left = 1;
    int right = MAX;
    

    while (left <= right) {
        int middle = (left + right) / 2;
        int sum = 0;

        for (int i = 0; i < N; i++) {
            if (budget[i] < middle) {
                sum += budget[i];
            } else {
                sum += middle;
            }
        }
        if (sum < M) {
            answer = max(middle, answer);
            left = middle + 1;
        } else if (sum > M) {
            right = middle - 1;
        } else {
            answer = middle;
            break;
        }
    }
    cout << answer;
}