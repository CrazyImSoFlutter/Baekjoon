#include <iostream>
using namespace std;

string MM, dd, hhmm;
int yyyy, totalMinute, passedDay, passedMinute;
string month[12] = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
int monthDay[12] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
double result;

void getTotalMinute() {
    if (yyyy % 400 == 0 || (yyyy % 4 == 0 && yyyy % 100 != 0)) {
        monthDay[1] = 29;
        totalMinute = 366 * 24 * 60;
    } else {
        totalMinute = 365 * 24 * 60;
    }
}

void getTotalPassedDay() {
    for (int i = 0; i < 12; i++) {
        if (MM == month[i]) {
            for (int j = 0; j < i; j++) passedDay += monthDay[j];
            break;
        }
    }
    passedDay += stoi(dd);
    passedDay--;
}

void getPassedMinute() {
    passedMinute += ((hhmm[0] - '0') * 10 + (hhmm[1] - '0')) * 60;
    passedMinute += (hhmm[3] - '0') * 10 + (hhmm[4] - '0');
    passedMinute += passedDay * 24 * 60;
}

void getAnswer() {
    result = (double)passedMinute / totalMinute * 100;
    printf("%0.9f\n", result);
}

int main() {
    cin >> MM >> dd >> yyyy >> hhmm;
    getTotalMinute();
    getTotalPassedDay();
    getPassedMinute();
    getAnswer();
}