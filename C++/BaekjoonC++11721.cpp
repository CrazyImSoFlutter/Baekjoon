#include <iostream>
#include <string>

using namespace std;

int main() {
    string a;
    int index, flag;

    cin >> a;
    index = 0;
    flag = 0;
    while (1) {
        for (int i = 0; i < 10; i++) {
            cout << a[index++];
            if (index == a.length()) {
                flag = 1;
                break;
            }      
        }
        cout << '\n';
        if (flag)
            break;
    }
}
