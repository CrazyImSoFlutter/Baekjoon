#include <iostream>
#include <algorithm>
#include <queue>

using namespace std;

int N, answer;
pair<int ,int> R[100001];
priority_queue<int, vector<int>, greater<int>> PQ;

void input() {
  int tmp;

  cin >> N;

  for (int i = 0; i < N; i++) {
    cin >> tmp >> R[i].first >> R[i].second;
  }
}

void solve() {
  sort(R, R + N);
  
  for (int i = 0; i < N; i++) {
    if (PQ.size()) {
      if (PQ.top() > R[i].first) {
        answer++;
      } else {
        PQ.pop();
      }
    } else {
      answer++;
    }
    PQ.push(R[i].second);
  }
}

void output() {
  cout << answer;
}

int main() {
  input();
  solve();
  output();
}