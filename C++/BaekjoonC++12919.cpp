#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

string S, T, tmp;
bool flag;

void sol(string t) {

    if (t == S) {
        cout << "1";
        exit(0);
    }
    if (S.size() >= t.size()) {
        return ;
    }
    
    if (t[t.size() - 1] == 'A') {
        tmp = t;
        tmp.erase(tmp.size() - 1);
        sol(tmp);
    }
    
    if (t[0] == 'B') {
        tmp = t;
        tmp.erase(tmp.begin());
        reverse(tmp.begin(), tmp.end());
        sol(tmp);
    }
}

int main() {
    cin >> S >> T;

    sol(T);
    cout << "0";
}