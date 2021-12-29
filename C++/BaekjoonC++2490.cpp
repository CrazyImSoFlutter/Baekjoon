#include <iostream>

using namespace std;

void game() {
    int tmp;
    int t;

    t = 0;
    for (int i = 0; i < 4; i++) {
        cin >> tmp;
        if (tmp == 1)
            t++;
    }
    switch(t) {
        case 0:
            cout << "D\n";
            break;
        case 1:
            cout << "C\n";
            break;
        case 2:
            cout << "B\n";
            break;
        case 3:
            cout << "A\n";
            break;
        case 4:
            cout << "E\n";
            break;
        default:
            break;
    }
    
}

int main() {
    game();
    game();
    game();
}
