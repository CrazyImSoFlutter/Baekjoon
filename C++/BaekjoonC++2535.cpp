#include <iostream>
#include <algorithm>
using namespace std;

class Student {
public:
    int nation;
    int stdId;
    int score;

    Student(int nation = 0, int stdId = 0, int score = 0) {
        this->nation = nation;
        this->stdId = stdId;
        this->score = score;
    }
};

bool compare(Student a, Student b) {
    return b.score < a.score;
}

Student students[101];
int N, nation, stdId, score;
int nationCount[101];

int main () {
    int index = 2;
    cin >> N;
    for (int i = 0; i < N; i++) {
        cin >> nation >> stdId >> score;

        students[i] = Student(nation, stdId, score);
    }
    sort(students, students + N, compare);
    cout << students[0].nation << " " << students[0].stdId << "\n";
    nationCount[students[0].nation]++;
    cout << students[1].nation << " " << students[1].stdId << "\n";
    nationCount[students[1].nation]++;
    
    while (true) {
        if (nationCount[students[index].nation] != 2) {
            cout << students[index].nation << " " << students[index].stdId << "\n";
            break;
        } else {
            index++;
        }
    }
}