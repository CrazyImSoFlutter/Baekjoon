#include <iostream>

using namespace std;

int idx;
char ucpc[4] = {'U', 'C', 'P', 'C'};
char UCPC[1001];

int main() {
    
    cin.getline(UCPC, 1001, '\n');

    for (int i = 0; i < 1001; i++) {
        if (UCPC[i] == ucpc[idx]) {
            idx++;
        }
    }
    if (idx >= 4) {
        cout << "I love UCPC";
    } else {
        cout << "I hate UCPC";
    }
}