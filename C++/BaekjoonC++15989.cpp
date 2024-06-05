#include <iostream>
#include <string.h>

using namespace std;

int T;
int dpTable[10001];

int main() {
    fill_n(dpTable, 10001, 1);

    for (int i = 2; i < 10001; i++) {
        dpTable[i] += dpTable[i - 2];
    }

    for (int i = 3; i < 10001; i++) {
        dpTable[i] += dpTable[i - 3];
    }

    cin >> T;
    for (int i = 0; i < T; i++) {
        int value;

        cin >> value;
        cout << dpTable[value] << "\n";
    }
}