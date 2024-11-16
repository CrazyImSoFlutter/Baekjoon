#include <iostream>
#include <queue>
#include <algorithm>

using namespace std;

int N, K;
int S[10000];
int D[10000];
int answer;

void input() {
  cin >> N >> K;
  for(int i = 0; i < N; i++){
    cin >> S[i];
  }
  sort(S, S + N);
}

void solve() {
  for(int i = 1; i < N; i++){
    D[i-1] = S[i] - S[i - 1];
  }
  sort(D, D + N);
  for(int i=0; i < N - K + 1; i++){
    answer += D[i];
  }
}

void output() {
  cout << answer << endl;
}

int main(void){
  input();
  solve();
  output();
}