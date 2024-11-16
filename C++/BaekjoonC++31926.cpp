#include <iostream>

using namespace std;

long long N;
long long answer;

void input() {
  cin >> N;
}

void solve() {
  while (N > 1) {
    N /= 2;
    answer ++;
  }
}

void output() {
  cout << answer + 10;
}


int main() {
  input();
  solve();
  output();
}