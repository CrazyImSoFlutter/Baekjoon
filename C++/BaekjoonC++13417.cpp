#include<iostream>
#include<vector>
#include<string>
using namespace std;

int T, N;
string answer;
vector<int> card;

void input() {
  char input;

  cin >> N;
  card = vector<int>(N);

  for (int i = 0; i < N; i++) {
    cin >> input;
    card[i] = int(input);
  }
}

void solve() {
  answer += char(card[0]);

  for (int i = 1; i < N; i++){
    if (card[i] <= int(answer[0])) {
      answer = char(card[i]) + answer;
    } else {
      answer = answer + char(card[i]);
    }
  }
}

void output() {
  cout << answer << endl;
  answer = "";
}


int main()
{
	cin >> T;

  while (T--) {
    input();
    solve();
    output();
  }
}