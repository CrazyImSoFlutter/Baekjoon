#include <iostream>

using namespace std;

int N, M, answer;

bool isValid(string room) {
  int cnt[10] = {0, };

  for(int i = 0; i < room.size(); i++) {
    cnt[room[i] - '0']++;
  }

  for(int i = 0; i < 10; i++) {
    if(cnt[i] >= 2)
        return false;
  }

  return true;
}

int main() {
  while(cin >> N >> M){
    answer = 0;

    for(int i = N; i <= M; i++){
      string room = to_string(i);
      
      if(isValid(room)) 
        answer++;
    }
    cout << answer << '\n';
  }
}