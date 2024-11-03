#include <iostream>

using namespace std;

long long X, Y, Z;
long long L, R, M;

int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);
  cout.tie(NULL);

  cin >> X >> Y;

  Z = (Y * 100) / X;

  if (Z >= 99) {
    cout << -1 << '\n';
    return 0;
  }

  L = 0;
  R = 1000000000;

  while (L <= R) {  
    M = (L + R) / 2;

    if (((Y + M) * 100) / (X + M) > Z) {
      R = M - 1;
    } else {
      L = M + 1;
    }
  }

  cout << L << '\n';
}