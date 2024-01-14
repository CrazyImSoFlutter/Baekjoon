#include <iostream>
using namespace std;

string str;

int main() {
    cin >> str;

    for (int i = 0; i < 3; i++) {
        cout << str[2 - i];
    }
}