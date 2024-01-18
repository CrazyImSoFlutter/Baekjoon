#include <iostream>
#include <algorithm>
using namespace std;

int N, answer;
string arr[50];

int main() {
    cin >> N;

    answer = N;
    for (int i = 0; i < N; i++) {
        cin >> arr[i];
    }

    sort(arr, arr + N);

    for (int i = 0; i < N; i++) {
        string tmp = arr[i + 1].substr(0, arr[i].size());
        if (tmp == arr[i]) {
            answer--;
        }
    }
    cout << answer;
}