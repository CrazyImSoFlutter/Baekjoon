#include <iostream>
#include <set>

using namespace std;

set<string> s;
int N;
char G;

int main() {
    cin >> N >> G;

    for (int i = 0; i < N; i++) {
        string tmp;

        cin >> tmp;
        s.insert(tmp);
    }

    switch (G) {
    case 'Y':
        cout << s.size();
        break;
    case 'F':
        cout << s.size() / 2;
        break;
    case 'O':
        cout << s.size() / 3;
        break;
    default:
        break;
    }
}