#include <iostream>
#include <vector>

using namespace std;

int N, tmp;
vector<int> sequence;
vector<int> answer;

int main() {
    cin >> N;

    for (int i = 0; i < N; i++) {
        cin >> tmp;
        sequence.push_back(tmp);
    }

    for (int i = N - 1; i >= 0; i--) {
        answer.insert(answer.begin() + sequence[i], i + 1);
    }

    for (int i = 0; i < N; i++) {
        cout << answer[i] << " ";
    }
}