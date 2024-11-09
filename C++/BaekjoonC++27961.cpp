#include <iostream>

using namespace std;

long long N, answer = 1;

void input() {
  cin >> N;
}

void solve() {
  long long cat = 1;

  while (true) {
    if (cat >= N) {
      break;
    }
    cat = cat * 2;
    ++answer;
  }
}

void output() {
  if (N == 0) {
    cout << 0 << endl;
  } else {
    cout << answer << endl;
  }
}

int main() {
  input();
  solve();
  output();
}