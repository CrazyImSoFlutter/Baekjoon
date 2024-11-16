#include <iostream>

using namespace std;

int N, L[101];
int answer;

void input() {
  cin >> N;

  for (int i = 0; i < N; i++) {
    cin >> L[i];
  }
}

void solve() {
  for (int i = N - 2; i >= 0; i--) {
    if (L[i + 1] <= L[i]) {
      answer += (L[i] - L[i + 1] + 1);
      L[i] = L[i + 1] - 1;
    }
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