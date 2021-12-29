#include <iostream>
#include <string>

using namespace std;

int main() {
    string a;
    int alphabet[26] = {};
    int odd;
    char tmp;

    cin >> a;
    for (int i = 0; i < a.length(); i++)
        alphabet[a[i] - 65]++;

    if (a.length() % 2 == 0)
        odd = 0;
    else
        odd = 1;

    tmp = 0;
    for (int i = 0; i < 26; i++) {
        if (alphabet[i] % 2 == 1) {
            odd--;
            alphabet[i]--;
            tmp = i + 65;
        }
    }

    if (odd < 0) {
        cout << "I'm Sorry Hansoo";
        return 0;
    }
    for (int i = 0; i < 26; i++) {
        for (int j = 0; j < alphabet[i] / 2; j++)
            cout << char(i + 65);
        alphabet[i] /= 2;
    }
    if (tmp != 0)
        cout << tmp;
    for (int i = 25; i >=0; i--) {
        for (int j = 0; j < alphabet[i]; j++)
            cout << char(i + 65);
    }
}
