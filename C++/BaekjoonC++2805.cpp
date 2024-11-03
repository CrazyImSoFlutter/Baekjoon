#include <iostream>
#include <algorithm>

using namespace std;

long long N, M;
long long tree[1000001];
long long answer = 0;

void input() {
  cin >> N >> M;

  for(int i = 0; i < N; i++) {
    cin >> tree[i];
  }

  sort(tree, tree + N);
}

void binarySearch() {
  long long left = 0;
  long long right = tree[N - 1];

  while (left <= right) {
    long long mid = (left + right) / 2;
    long long sum = 0;

    for (long long i = 0; i < N; i++) {
      if (mid < tree[i]) {
        sum += (tree[i] - mid);
      } 
    }

    if (sum >= M) {
      if (answer < mid) {
        answer = mid;
      }
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
}

void output() {
  cout << answer;
}

int main() {
  input();
  binarySearch();
  output();
}