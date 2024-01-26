#include <iostream>
#include <algorithm>

using namespace std;

int pig[6];
int prevPig[6];
int T, N;

int feed(int day) {
  int result = 0;
  
  if(day != 1) {
    for(int i = 0; i < 6; i++) {
      int left = (i + 6 - 1) % 6;
      int right = (i + 6 + 1) % 6;
      int opposite = (i + 3) % 6;

      pig[i] = prevPig[i] + prevPig[left] + prevPig[right] + prevPig[opposite];
    }

    copy(pig, pig + 6, prevPig);
  }

  for(int i = 0; i < 6; i++) {
    result += pig[i];
  }

  return result;
}

int main() {
  cin >> T;

  for(int i = 0; i < T; i++) {
    int answer = 1;

    cin >> N;
    for(int j = 0; j < 6; j++) {
      cin >> pig[j];
      prevPig[j] = pig[j];
    }
    
    while(true) {
      int usedFeed = feed(answer);
      
      if(usedFeed > N) {
        cout << answer << '\n';
        break;
      }

      answer++;
    }
  }
}