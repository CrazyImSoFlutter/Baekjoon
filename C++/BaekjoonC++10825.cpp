#include <iostream>
#include <algorithm>

using namespace std;

class Student {
public: 
    string name;
    int kor;
    int eng;
    int math;
};

bool compare(Student a, Student b) {
    if (a.kor == b.kor && a.eng == b.eng && a.math == b.math)
        return a.name < b.name;
    
    if (a.kor == b.kor && a.eng == b.eng)
        return a.math > b.math;

    if (a.kor == b.kor)
        return a.eng < b.eng;
    
    return a.kor > b.kor;
} 

int N;
Student s[100001];

int main() {
    cin >> N;

    for (int i = 0; i < N; i++) {
        cin >> s[i].name >> s[i].kor >> s[i].eng >> s[i].math;
    }

    sort(s, s + N, compare);

    for (int i = 0; i < N; i++) {
        cout << s[i].name << '\n';
    }
}