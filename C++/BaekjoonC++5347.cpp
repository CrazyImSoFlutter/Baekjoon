#include <iostream>

using namespace std;
long long N, A, B, gcd;

long long GCD(int a, int b) {
    long long r = a % b;

    if (r == 0)
        return b;
    else
        return GCD(b, r);
}

int main(){
  cin >> N;
  for (int i = 0; i < N; i++) {
    long long lcm = 0;

    cin >> A >> B;
    lcm = A * B / GCD(A, B);
    cout << lcm << '\n';
  }
}