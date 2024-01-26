#include <iostream>
#include <algorithm>

using namespace std;

class Score {
public:
    int number;
    int score;
};

Score score[8];
int sum, answer[5];

bool compare (Score A, Score B) {
    return A.score > B.score;
}

bool compare2 (int a, int b) {
    return a < b;
}

int main() {
    for (int i = 0; i < 8; i++) {
        cin >> score[i].score;
        score[i].number = i + 1;
    }

    sort(score, score + 8, compare);
    
    for (int i = 0; i < 5; i++) {
        sum += score[i].score;
        answer[i] = score[i].number;
    }

    sort(answer, answer + 5, compare2);
    cout << sum << '\n';
    
    for (int i = 0; i < 5; i++) {
        cout << answer[i];
        if (i != 4)
            cout << " ";
    }
}