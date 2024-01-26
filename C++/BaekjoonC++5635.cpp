#include <iostream>
#include <algorithm>

using namespace std;

class Student {
public:
    string name;
    int day;
    int month;
    int year;
};

bool compare(Student s1, Student s2) {
    if (s1.year != s2.year) {
        return s1.year > s2.year;
    }
    if (s1.month != s2.month) {
        return s1.month > s2.month;
    }
    if (s1.day != s2.day) {
        return s1.day > s2.day;
    }
    return false;
}

Student s[100];
int N;

int main() {
    cin >> N;

    for (int i = 0; i < N; i++) {
        cin >> s[i].name >> s[i].day >> s[i].month >> s[i].year;
    }

    sort(s, s + N, compare);
    cout << s[0].name << '\n';
    cout << s[N - 1].name << '\n';
}