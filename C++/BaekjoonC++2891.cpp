#include <iostream>

using namespace std;

int N, S, R, answer, number, kayak[12];

int main(){
  cin >> N >> S >> R;

  for (int i = 1; i <= N; i++) {
    kayak[i] = 1;
  }

  for (int i = 0; i < S; i++) {
    cin >> number;
    kayak[number]--;
  }

  for (int i = 0; i < R; i++) {
    cin >> number;
    kayak[number]++;
  }

  for (int i = 1; i <= N; i++) {
    if (kayak[i] == 2) {
      if (!kayak[i - 1]) {
        kayak[i] = kayak[i - 1] = 1;
        continue;
      }
    }

    if (kayak[i] == 2) {
      if (!kayak[i + 1]) {
        kayak[i] = kayak[i + 1] = 1;
        continue;
      }
    }
  }

  for (int i = 1; i <= N; i++)
    if (!kayak[i])
      answer++;

  cout << answer;
}